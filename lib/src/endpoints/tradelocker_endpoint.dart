import 'dart:async';

import 'package:dio/dio.dart';
import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/tradelocker_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/models/trade_extension.dart';
import 'package:tradelog_server/src/models/tradelocker_extension.dart';
import 'package:tradelog_server/src/rate_limiter/request_queue.dart';
import 'package:tradelog_server/src/util/configuration.dart';

class TradeLockerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  late TradeLockerClient client;

  static late RequestQueue requestQueue;

  void setQueue(RequestQueue queue) {
    requestQueue = queue;
  }

  Future<void> initializeClient(
    Session session, {
    int accNum = -1,
  }) async {
    var authenticated = await session.authenticated;
    var accessToken = await session.caches.localPrio
        .get<AccessToken>('tradelocker-${authenticated!.userId}');

    if (accessToken != null) {
      client = TradeLockerClient(
        Configuration.tradelockerURI,
        accessToken.token,
        accNum: accNum == -1 ? '' : accNum.toString(),
      );
      return;
    }

    var linkedAccount = await LinkedAccount.db.findFirstRow(
      session,
      where: (o) =>
          o.userInfoId.equals(authenticated.userId) &
          o.platform.equals(Platform.Tradelocker),
    );

    if (linkedAccount == null) {
      throw Exception('Access token not found in cache/No account linked');
    }

    accessToken = AccessToken(token: linkedAccount.apiKey);

    await session.caches.localPrio
        .put('tradelocker-${authenticated.userId}', accessToken);

    client = TradeLockerClient(
      Configuration.tradelockerURI,
      accessToken.token,
      accNum: accNum == -1 ? '' : accNum.toString(),
    );
  }

  // Error handling and retrying function
  Future<Response> safeApiCall(Future<Response> apiCall) async {
    try {
      final response = await apiCall;
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            'Failed to load data - Error code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 502) {
        // Retry after a short delay for 502 errors
        await Future.delayed(Duration(seconds: 1));
        return safeApiCall(apiCall);
      } else {
        rethrow;
      }
    }
  }

  Future<String> authenticate(
    Session session,
    String email,
    String password,
    String server,
  ) async {
    var authenticated = await session.authenticated;
    client = TradeLockerClient(
      Configuration.tradelockerURI,
      '',
    );

    // Step 1: Perform authentication
    final data = await _performAuthentication(client, email, password, server);

    final accessToken = data['accessToken'] as String;
    final refreshToken = data['refreshToken'] as String;

    // Step 2: Store tokens and update credentials in the database
    await _storeTokens(session, authenticated!.userId, accessToken,
        refreshToken, email, password, server);

    // Step 3: Manage Linked Account
    await _manageLinkedAccount(session, authenticated.userId, accessToken);

    return accessToken;
  }

  Future<String> refresh(Session session) async {
    var authenticated = await session.authenticated;

    var creds = await TradelockerCredentials.db.findFirstRow(
      session,
      where: (o) => o.userId.equals(authenticated!.userId),
    );

    if (creds == null) {
      throw Exception('Credentials not found');
    }

    await initializeClient(session);

    final response = await client.post(
      '/auth/jwt/refresh',
      {'refreshToken': creds.refreshToken},
    );

    if (response.statusCode == 201) {
      final data = response.data
          as Map<String, dynamic>; // Ensure response data is a map
      final accessToken = data['accessToken'] as String;

      await session.caches.localPrio.put('tradelocker-${authenticated!.userId}',
          AccessToken(token: accessToken));

      var linkedAccount = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) => o.userInfoId.equals(authenticated.userId),
      );

      if (linkedAccount != null) {
        linkedAccount.apiKey = accessToken;
        await LinkedAccount.db.updateRow(session, linkedAccount);
      }

      return accessToken;
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  Future<List<DisplayTrade>> getTrades(
      Session session, int accountId, int accNum) async {
    // Initialize client for the current session
    await initializeClient(session, accNum: accNum);
    final positions =
        await getPositionsWithRateLimit(session, accountId, accNum);
    final orders =
        await getOrdersHistoryWithRateLimit(session, accountId, accNum);
    // Future to hold the final list of DisplayTrades
    final tradesFuture = Completer<List<DisplayTrade>>();

    // Add the main request to fetch positions and orders to the queue
    requestQueue.addRequest(
      EndpointRequest(
        priority: 1,
        request: () async {
          // Fetch positions and orders in parallel
          try {
            // Map orders to their respective positions
            final Map<String, List<TradelockerOrder>> ordersByPosition =
                _groupOrdersByPosition(orders);

            // Process the positions to create trades
            final List<DisplayTrade> trades = await _processPositions(
                session, positions, ordersByPosition, accNum);

            // Complete the future with the list of trades
            tradesFuture.complete(trades);
          } on Exception catch (e) {
            tradesFuture.completeError(e);
          }
        },
        hasSubRequests: true, // There will be sub-requests to fetch symbols
        subRequestsCount:
            1, // Assuming each position requires one sub-request to get the symbol
        subRequestDelay:
            Duration(milliseconds: 500), // Sub-requests rate-limited by 500ms
      ),
    );

    // Return the result when the queue finishes processing
    return await tradesFuture.future;
  }

  Future<List<DisplayTrade>> _processPositions(
      Session session,
      List<TradelockerPosition> positions,
      Map<String, List<TradelockerOrder>> ordersByPosition,
      int accNum) async {
    final List<DisplayTrade> trades = [];
    int idx = 0;
    for (var position in positions) {
      print(idx++);
      final associatedOrders = ordersByPosition[position.id] ?? [];

      // Calculate realized P&L and ROI for the position
      final realizedPl = _calculateRealizedPl(position, associatedOrders);
      final totalInvestment = position.quantity * position.avgPrice;
      final netRoi =
          totalInvestment != 0 ? (realizedPl / totalInvestment) * 100 : 0.0;
      final status = position.quantity == 0 ? 'Closed' : 'Open';

      // Sub-request: Fetch symbol for each position, queued and rate-limited
      final symbol = await _getSymbolFromInstrumentIdWithRateLimit(
          session, accNum, position.tradableInstrumentId, position.routeId);

      // Create a DisplayTrade entry and add it to the list
      trades.add(DisplayTrade(
        openTime: position.openDate,
        symbol: symbol,
        direction: position.side,
        status: status,
        netpl: realizedPl,
        netroi: netRoi,
      ));
    }

    print(trades);
    return trades;
  }

  double _calculateRealizedPl(
      TradelockerPosition position, List<TradelockerOrder> orders) {
    double realizedPl = 0.0;

    for (var order in orders) {
      if (order.status == 'Filled' && order.filledQty > 0) {
        realizedPl += (order.filledQty * (order.avgPrice - position.avgPrice));
      }
    }

    return realizedPl;
  }

  Map<String, List<TradelockerOrder>> _groupOrdersByPosition(
      List<TradelockerOrder> orders) {
    final Map<String, List<TradelockerOrder>> ordersByPosition = {};

    for (var order in orders) {
      if (order.positionId != null) {
        ordersByPosition.putIfAbsent(order.positionId!, () => []).add(order);
      }
    }

    return ordersByPosition;
  }

  Future<String> _getSymbolFromInstrumentIdWithRateLimit(
      Session session, int accNum, int instrumentId, int routeId) async {
    final instrument =
                await _getInstrument(session, accNum, instrumentId, routeId);
    return instrument.name;
    // final symbolFuture = Completer<String>();

    // // Add a request to the queue to fetch the symbol
    // requestQueue.addRequest(
    //   EndpointRequest(
    //     priority: 2, // Lower priority for sub-requests
    //     request: () async {
    //       try {
    //         final instrument =
    //             await _getInstrument(session, accNum, instrumentId, routeId);
    //             print(instrument.name);
    //         symbolFuture.complete(instrument.name);
    //       } on Exception catch (e) {
    //         symbolFuture.completeError(e);
    //       }
    //     },
    //     subRequestsCount: 0, // No further sub-requests in this case
    //   ),
    // );

    // return await symbolFuture.future;
  }

  Future<TradelockerInstrument> _getInstrument(
      Session session, int accNum, int instrumentId, int routeId) async {
    await initializeClient(session, accNum: accNum);
    final response =
        await client.get('/trade/instruments/$instrumentId?routeId=$routeId');

    if (response.statusCode == 200 && response.data['d'] != null) {
      return TradelockerInstrument.fromJson(response.data['d']);
    } else {
      throw Exception('Failed to load instrument data.');
    }
  }

  /// Private Helper Functions

  Future<List<TradelockerPosition>> getPositionsWithRateLimit(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final positionsFuture = Completer<List<TradelockerPosition>>();
    requestQueue.addRequest(
      EndpointRequest(
        priority: 1,
        request: () async {
          try {
            final response =
                await client.get('/trade/accounts/$accountId/positions');
            final positions = response.data['d']['positions'] as List<dynamic>;
            positionsFuture.complete(positions
                .map((position) => TradeLockerExtension.positionFromJson(
                    position as List<dynamic>))
                .toList());
          } catch (e) {
            positionsFuture.completeError(
                e); // Complete the future with an error if it fails
          }
        },
      ),
    );

    return await positionsFuture.future;
  }

  Future<List<TradelockerOrder>> getOrdersHistoryWithRateLimit(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final ordersFuture = Completer<List<TradelockerOrder>>();
    requestQueue.addRequest(
      EndpointRequest(
        priority: 1,
        request: () async {
          try {
            final response =
                await client.get('/trade/accounts/$accountId/ordersHistory');

            // Check if the response is valid and contains the expected data
            if (response.data == null || response.data['d'] == null) {
              throw Exception('Invalid response or no data found.');
            }

            // Extract and process the orders
            final orders =
                response.data['d']['ordersHistory'] as List<dynamic>?;
            if (orders == null) {
              throw Exception('No orders found in the response.');
            }

            // Complete the future with the list of processed orders
            ordersFuture.complete(orders
                .map((order) =>
                    TradeLockerExtension.orderFromJson(order as List<dynamic>))
                .toList());
          } catch (e) {
            // Complete the future with an error if anything fails
            ordersFuture.completeError(e);
            print('Error processing orders: $e');
          }
        },
      ),
    );

    return await ordersFuture.future;
  }

// Future<String> _getSymbolFromInstrumentIdWithRateLimit(
//     Session session, int accNum, int instrumentId, int routeId) async {
//   // Use the rate limiter before making the API request
//   await rateLimiter.waitForAvailability();

//   final instrument =
//       await _getInstrument(session, accNum, instrumentId, routeId);
//   return instrument.name;
// }

// Future<TradelockerInstrument> _getInstrument(
//     Session session, int accNum, int instrumentId, int routeId) async {
//   await initializeClient(session, accNum: accNum);

//   final response =
//       await client.get('/trade/instruments/$instrumentId?routeId=$routeId');
//   if (response.statusCode == 200) {
//     if (response.data != null && response.data['d'] != null) {
//       return TradelockerInstrument.fromJson(response.data['d']);
//     } else {
//       throw Exception('No data found for this instrument.');
//     }
//   } else {
//     throw Exception(
//         'Failed to load data - Error code: ${response.statusCode}');
//   }
// }

  Future<Map<String, dynamic>> _performAuthentication(
    TradeLockerClient client,
    String email,
    String password,
    String server,
  ) async {
    try {
      final response = await client.post(
        '/auth/jwt/token',
        {
          'email': email,
          'password': password,
          'server': server,
        },
      );

      if (response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        return data;
      } else {
        throw Exception('Failed to authenticate: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 500) {
          throw Exception('Internal server error: ${e.response?.data}');
        } else {
          throw Exception('Failed to authenticate: ${e.message}');
        }
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }

  Future<void> _storeTokens(
    Session session,
    int userId,
    String accessToken,
    String refreshToken,
    String email,
    String password,
    String server,
  ) async {
    try {
      // Store access token in cache
      await session.caches.localPrio.put(
        'tradelocker-$userId',
        AccessToken(token: accessToken),
      );
    } catch (e) {
      throw Exception('Failed to store access token: $e');
    }

    try {
      // Check if credentials already exist in the database
      var checkCred = await TradelockerCredentials.db
          .findFirstRow(session, where: (o) => o.userId.equals(userId));

      if (checkCred == null) {
        var account = TradelockerCredentials(
          email: email,
          password: password,
          server: server,
          userId: userId,
          refreshToken: refreshToken,
        );
        await TradelockerCredentials.db.insertRow(session, account);
      } else {
        checkCred.email = email;
        checkCred.password = password;
        checkCred.server = server;
        checkCred.refreshToken = refreshToken;
        await TradelockerCredentials.db.updateRow(session, checkCred);
      }
    } catch (e) {
      throw Exception('Failed to store/update credentials: $e');
    }
  }

  Future<void> _manageLinkedAccount(
      Session session, int userId, String accessToken) async {
    try {
      var checkLinked = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) => o.userInfoId.equals(userId),
      );

      if (checkLinked == null) {
        var linkedAccount = LinkedAccount(
          userInfoId: userId,
          apiKey: accessToken,
          platform: Platform.Tradelocker,
        );
        await LinkedAccount.db.insertRow(session, linkedAccount);
      } else {
        checkLinked.apiKey = accessToken;
        await LinkedAccount.db.updateRow(session, checkLinked);
      }
    } catch (e) {
      throw Exception('Failed to manage linked account: $e');
    }
  }
}
