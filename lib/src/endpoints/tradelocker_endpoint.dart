import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/tradelocker_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/models/tradelocker_extension.dart';
import 'package:tradelog_server/src/rate_limiter/request_queue.dart';
import 'package:tradelog_server/src/util/configuration.dart';
import 'package:tradelog_server/src/util/instruments.dart';

class TradeLockerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  late TradeLockerClient client;

  static late RequestQueue requestQueue;

  void setQueue(RequestQueue queue) {
    requestQueue = queue;
  }

  Future<void> initializeClient(
    Session session,
    String apiKey, {
    int accNum = -1,
  }) async {
    client = TradeLockerClient(
      Configuration.tradelockerURI,
      apiKey,
      accNum: accNum == -1 ? '' : accNum.toString(),
    );
  }

  Future<String> authenticate(
    Session session,
    String email,
    String password,
    String server, {
    String? title,
  }) async {
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
    await _manageLinkedAccount(
      session,
      authenticated.userId,
      accessToken,
      email,
      title,
    );

    return accessToken;
  }

  Future<void> refresh(Session session) async {
    var authenticated = await session.authenticated;

    // Retrieve all TradeLocker credentials for the authenticated user
    var credentialsList = await TradelockerCredentials.db.find(
      session,
      where: (o) => o.userId.equals(authenticated!.userId),
    );

    if (credentialsList.isEmpty) {
      throw Exception('No credentials found for this user');
    }

    await initializeClient(session, "");

    // Iterate over each set of credentials and refresh tokens
    for (var creds in credentialsList) {
      requestQueue.addRequest(
        EndpointRequest(
            priority: 1,
            request: () async {
              try {
                final response = await client.post(
                  '/auth/jwt/refresh',
                  {'refreshToken': creds.refreshToken},
                );

                if (response.statusCode == 201) {
                  final data = response.data as Map<String, dynamic>;
                  final newAccessToken = data['accessToken'] as String;

                  // Find linked accounts associated with the current credentials
                  var linkedAccount = await LinkedAccount.db.findFirstRow(
                    session,
                    where: (o) =>
                        o.userInfoId.equals(authenticated!.userId) &
                        o.tradelockerCredentialsId.equals(creds.id),
                  );

                  if (linkedAccount == null) {
                    throw Exception(
                        'Linked account not found for credentials ID ${creds.id}');
                  } else {
                    // Update the access token for each linked account related to the current credentials
                    linkedAccount.apiKey = newAccessToken;
                    await LinkedAccount.db.updateRow(session, linkedAccount);
                  }
                } else {
                  print(
                      'Failed to refresh token for credentials ID ${creds.id}');
                }
              } catch (e) {
                print(
                    'Error refreshing token for credentials ID ${creds.id}: $e');
              }
            }),
      );
    }
  }

  Future<List<DisplayTrade>> getAllTrades(Session session) async {
    // Ensure the user is authenticated
    var authenticated = await session.authenticated;

    // Fetch linked accounts for the user with platform == Platform.Tradelocker
    var linkedAccounts = await LinkedAccount.db.find(
      session,
      where: (o) =>
          o.userInfoId.equals(authenticated!.userId) &
          o.platform.equals(Platform.Tradelocker),
    );

    List<DisplayTrade> allTrades = [];

    for (var linkedAccount in linkedAccounts) {
      if (linkedAccount.tradelockerAccountId == null ||
          linkedAccount.tradelockerAccounts == null) {
        throw Exception('No subaccounts found');
      }

      String apiKey = linkedAccount.apiKey;
      final accountIds = linkedAccount.tradelockerAccountId!;
      final accountNumbers = linkedAccount.tradelockerAccounts!;

      // Ensure accountIds and accountNumbers have the same length
      if (accountIds.length != accountNumbers.length) {
        throw Exception('Mismatch between account IDs and account numbers');
      }

      for (int i = 0; i < accountIds.length; i++) {
        var accountId = int.parse(accountIds[i]);
        var accountNumber = int.parse(accountNumbers[i]);

        // Call getTrades for this account
        try {
          List<DisplayTrade> trades =
              await getTrades(session, apiKey, accountId, accountNumber);
          allTrades.addAll(trades);
        } catch (e) {
          // Handle errors for this account and continue
          print('Error fetching trades for account $accountId: $e');
          continue;
        }
      }
    }

    // Optionally, sort the trades by openTime
    allTrades.sort((a, b) => a.openTime.compareTo(b.openTime));

    return allTrades;
  }

  Future<List<DisplayTrade>> getTrades(
      Session session, String apiKey, int accountId, int accNum) async {
    // Initialize client for the current session
    await initializeClient(session, apiKey, accNum: accNum);

    // Fetch positions and orders from the external API (rate-limited)
    final positions =
        await _getPositionsWithRateLimit(session, apiKey, accountId, accNum);
    final orders =
        await getOrdersHistoryWithRateLimit(session, apiKey, accountId, accNum);

    // Map orders to their respective positions
    final Map<String, List<TradelockerOrder>> ordersByPosition =
        _groupOrdersByPosition(orders);

    // Set of position IDs from open positions
    final openPositionIds = positions.map((position) => position.id).toSet();

    // Wait for both open and closed trades to complete
    final List<DisplayTrade> openTrades =
        await _processPositions(session, positions, ordersByPosition, accNum);
    final List<DisplayTrade> closedTrades = await _processClosedPositions(
        session, ordersByPosition, openPositionIds, accNum);

    // Return the combined list of open and closed trades
    return [...openTrades, ...closedTrades];
  }

  /// Private Helper Functions

  Future<List<DisplayTrade>> _processClosedPositions(
      Session session,
      Map<String, List<TradelockerOrder>> ordersByPosition,
      Set<String> openPositionIds,
      int accNum) async {
    final List<DisplayTrade> trades = [];

    // Process closed positions (positions not present in openPositionIds)
    for (var orderGroup in ordersByPosition.entries) {
      final positionId = orderGroup.key;
      final associatedOrders = orderGroup.value;

      // If the position is not in the set of open positions, it's closed
      if (!openPositionIds.contains(positionId)) {
        final firstOrder = associatedOrders.first;
        double totalQty = 0.0;
        double avgPrice = 0.0;
        double realizedPl = 0.0;

        // Calculate realized P&L and the average price of the closed position
        for (var order in associatedOrders) {
          if (order.status == 'Filled' && order.filledQty > 0) {
            totalQty += order.filledQty;
            avgPrice += order.avgPrice * order.filledQty;
            realizedPl += order.filledQty * (order.avgPrice - firstOrder.price);
          }
        }

        if (totalQty > 0) {
          avgPrice = avgPrice / totalQty; // Weighted average price
        }

        // Calculate net ROI
        final totalInvestment = totalQty * avgPrice;
        final netRoi =
            totalInvestment != 0 ? (realizedPl / totalInvestment) * 100 : 0.0;

        // Fetch symbol for closed position
        final symbol =
            Instrument.instrumentMap[firstOrder.tradableInstrumentId] ??
                'unknown';

        // Create a DisplayTrade object for the closed position
        trades.add(DisplayTrade(
          openTime: firstOrder.createdDate,
          symbol: symbol,
          direction: firstOrder.side,
          status: 'Closed',
          netpl: realizedPl,
          netroi: netRoi,
        ));
      }
    }

    // print(trades);
    return trades;
  }

  Future<List<DisplayTrade>> _processPositions(
      Session session,
      List<TradelockerPosition> positions,
      Map<String, List<TradelockerOrder>> ordersByPosition,
      int accNum) async {
    final List<DisplayTrade> trades = [];

    for (var position in positions) {
      final associatedOrders = ordersByPosition[position.id] ?? [];

      // Calculate realized P&L and ROI for the position
      final realizedPl = _calculateRealizedPl(position, associatedOrders);
      final totalInvestment = position.quantity * position.avgPrice;
      final netRoi =
          totalInvestment != 0 ? (realizedPl / totalInvestment) * 100 : 0.0;
      final status = position.quantity == 0 ? 'Closed' : 'Open';

      // Sub-request: Fetch symbol for each position, queued and rate-limited
      final symbol = Instrument.instrumentMap[position.tradableInstrumentId] ??
          'unknown'; // Default to 'unknown' if symbol not found

      // Create a DisplayTrade entry and add it to the list
      trades.add(
        DisplayTrade(
          openTime: position.openDate,
          symbol: symbol,
          direction: position.side,
          status: status,
          netpl: realizedPl,
          netroi: netRoi,
        ),
      );
    }

    // print(trades);
    return trades;
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

  Future<List<TradelockerPosition>> _getPositionsWithRateLimit(
      Session session, String apiKey, int accountId, int accNum) async {
    await initializeClient(session, apiKey, accNum: accNum);

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
            // Send to Sentry for monitoring
            Sentry.captureException(e);

            positionsFuture.completeError(
                e); // Complete the future with an error if it fails
          }
        },
      ),
    );

    return await positionsFuture.future;
  }

  Future<List<TradelockerOrder>> getOrdersHistoryWithRateLimit(
      Session session, String apiKey, int accountId, int accNum) async {
    await initializeClient(session, apiKey, accNum: accNum);

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
              // print(response.data); // uncomment if random error
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
            // Send to Sentry for monitoring
            Sentry.captureException(e);

            // Complete the future with an error if anything fails
            ordersFuture.completeError(e);
            print('Error processing orders: $e');
          }
        },
      ),
    );

    return await ordersFuture.future;
  }

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
    Session session,
    int userId,
    String accessToken,
    String email,
    String? title,
  ) async {
    try {
      var checkLinked = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) => o.userInfoId.equals(userId),
      );

      var creds = await TradelockerCredentials.db.findFirstRow(
        session,
        where: (o) => o.email.equals(email),
      );

      if (creds == null) {
        throw Exception('Credentials not found');
      }

      final accounts = await getAccounts(session, accessToken);
      List<String> accountIds = accounts.map((x) => x.id).toList();
      List<String> accountNumbers = accounts.map((x) => x.accNum).toList();

      if (checkLinked == null) {
        var linkedAccount = LinkedAccount(
          userInfoId: userId,
          apiKey: accessToken,
          platform: Platform.Tradelocker,
          tradelockerCredentialsId: creds.id,
          tradelockerAccountId: accountIds,
          tradelockerAccounts: accountNumbers,
          title: title,
        );
        await LinkedAccount.db.insertRow(session, linkedAccount);
      } else {
        checkLinked.apiKey = accessToken;
        checkLinked.tradelockerAccountId = accountIds;
        checkLinked.tradelockerAccounts = accountNumbers;
        checkLinked.title = title;
        await LinkedAccount.db.updateRow(session, checkLinked);
      }
    } catch (e) {
      throw Exception('Failed to manage linked account: $e');
    }
  }

  Future<List<TradelockerAccountInformation>> getAccounts(
      Session session, String apiKey) async {
    await initializeClient(session, apiKey);

    final accountsFuture = Completer<List<TradelockerAccountInformation>>();
    requestQueue.addRequest(
      EndpointRequest(
        priority: 1,
        request: () async {
          try {
            final response = await client.get('/auth/jwt/all-accounts');

            // Check if 'accounts' key exists in the response data
            if (response.data == null ||
                !response.data.containsKey('accounts')) {
              throw Exception('Missing accounts key in response');
            }
            print(response.data.toString());

            var accountsData = response.data['accounts'];

            // Map accounts data to TradelockerAccountInformation objects
            accountsFuture.complete(List<TradelockerAccountInformation>.from(
                accountsData
                    .map((x) => TradelockerAccountInformation.fromJson(x))));
          } catch (e) {
            // Log the error before completing with an error
            print("Error occurred in getAccounts: $e");
            accountsFuture.completeError(e); // Complete with error if it fails
          }
        },
      ),
    );

    return await accountsFuture.future;
  }
}
