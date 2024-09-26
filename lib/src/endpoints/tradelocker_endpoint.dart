import 'package:dio/dio.dart';
import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/tradelocker_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/models/trade_extension.dart';
import 'package:tradelog_server/src/models/tradelocker_extension.dart';
import 'package:tradelog_server/src/util/configuration.dart';

class TradeLockerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  late TradeLockerClient client;

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
      print(accessToken);
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

  Future< /*Map<String, dynamic>*/ String> getAccounts(Session session) async {
    await initializeClient(session);

    final response = await client.get('/auth/jwt/all-accounts');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  Future<List<TradelockerPosition>> getPositions(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response = await client.get('/trade/accounts/$accountId/positions');
    print(response.data);
    if (response.statusCode == 200) {
      final positions = response.data['d']['positions'] as List<dynamic>;

      return positions
          .map((position) =>
              TradeLockerExtension.positionFromJson(position as List<dynamic>))
          .toList();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  //Future<TradelockerIns

  Future< /*Map<String, dynamic>*/ String> getOrders(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response = await client.get('/trade/accounts/$accountId/orders');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  Future<List<TradelockerOrder>> getOrdersHistory(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response =
        await client.get('/trade/accounts/$accountId/ordersHistory');
    if (response.statusCode == 200) {
      final orders = response.data['d']['ordersHistory'] as List<dynamic>;

      return orders
          .map((order) =>
              TradeLockerExtension.orderFromJson(order as List<dynamic>))
          .toList();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  Future<TradelockerInstrument> getInstrument(
      Session session, int accNum, int instrumentId, int routeId) async {
    await initializeClient(session, accNum: accNum);

    final response =
        await client.get('/trade/instruments/$instrumentId?routeId=$routeId');
    if (response.statusCode == 200) {
      if (response.data != null && response.data['d'] != null) {
        return TradelockerInstrument.fromJson(response.data['d']);
      } else {
        throw Exception('No data found for this instrument.');
      }
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  Future<List<TradelockerPosition>> getPositionsWithRateLimit(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response = await client.get('/trade/accounts/$accountId/positions');

    await Future.delayed(Duration(
        milliseconds:
            500)); // 500ms delay to stay within 2 requests/second limit

    if (response.statusCode == 200) {
      final positions = response.data['d']['positions'] as List<dynamic>;

      return positions
          .map((position) =>
              TradeLockerExtension.positionFromJson(position as List<dynamic>))
          .toList();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  Future<List<TradelockerOrder>> getOrdersHistoryWithRateLimit(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response =
        await client.get('/trade/accounts/$accountId/ordersHistory');

    await Future.delayed(Duration(
        milliseconds:
            500)); // 500ms delay to stay within 2 requests/second limit

    if (response.statusCode == 200) {
      final orders = response.data['d']['ordersHistory'] as List<dynamic>;

      return orders
          .map((order) =>
              TradeLockerExtension.orderFromJson(order as List<dynamic>))
          .toList();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  Future<String> getSymbolFromInstrumentIdWithRateLimit(
      Session session, int accNum, int instrumentId, int routeId) async {
    await Future.delayed(
        Duration(milliseconds: 500)); // Add delay before calling API

    final instrument = await getInstrument(session, accNum, instrumentId, routeId);
    return instrument.name;
  }

  Future<List<DisplayTrade>> getTrades(Session session, int accountId, int accNum) async {
  // Get open positions and all orders in parallel
  final positionsFuture = getPositionsWithRateLimit(session, accountId, accNum);
  final ordersFuture = getOrdersHistoryWithRateLimit(session, accountId, accNum);

  // Wait for both futures to complete
  final positions = await positionsFuture;
  final orders = await ordersFuture;

  // Map of positionId to its corresponding orders
  final Map<String, List<TradelockerOrder>> ordersByPosition = {};

  // Group orders by positionId
  for (var order in orders) {
    if (order.positionId != null) {
      ordersByPosition.putIfAbsent(order.positionId!, () => []).add(order);
    }
  }

  // Set of position IDs from open positions
  final openPositionIds = positions.map((position) => position.id).toSet();

  // List of trades to be returned
  final trades = <DisplayTrade>[];

  // Process open positions
  for (var position in positions) {
    final associatedOrders = ordersByPosition[position.id] ?? [];

    // Compute netpl and netroi for open positions
    double realizedPl = 0.0;
    double totalInvestment = position.quantity * position.avgPrice;

    for (var order in associatedOrders) {
      if (order.status == 'Filled' && order.filledQty > 0) {
        // Calculate profit/loss from filled orders
        realizedPl += (order.filledQty * (order.avgPrice - position.avgPrice));
      }
    }

    // Calculate net ROI
    double netRoi = totalInvestment != 0 ? (realizedPl / totalInvestment) * 100 : 0.0;

    // Determine the status of the position
    String status = position.quantity == 0 ? 'Closed' : 'Open';

    // Get the symbol from the instrument ID
    final symbol = await getSymbolFromInstrumentIdWithRateLimit(session, accNum, position.tradableInstrumentId, position.routeId);

    // Create a DisplayTrade object for open position
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

    // Add delay to respect API rate limit
    await Future.delayed(Duration(milliseconds: 500));
  }

  // Process closed positions (positions not present in openPositionIds)
  for (var orderGroup in ordersByPosition.entries) {
    final positionId = orderGroup.key;
    final associatedOrders = orderGroup.value;

    // If the position is not in the set of open positions, it's closed
    if (!openPositionIds.contains(positionId)) {
      // Assuming the first order gives us an idea about the closed position details
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
      double totalInvestment = totalQty * avgPrice;
      double netRoi = totalInvestment != 0 ? (realizedPl / totalInvestment) * 100 : 0.0;

      // Assume the order's createdDate is the open time for closed positions
      final symbol = await getSymbolFromInstrumentIdWithRateLimit(session, accNum, firstOrder.tradableInstrumentId, firstOrder.routeId);

      // Create a DisplayTrade object for the closed position
      trades.add(
        DisplayTrade(
          openTime: firstOrder.createdDate,
          symbol: symbol,
          direction: firstOrder.side,
          status: 'Closed',
          netpl: realizedPl,
          netroi: netRoi,
        ),
      );

      // Add delay to respect API rate limit
      await Future.delayed(Duration(milliseconds: 500));
    }
  }

  return trades;
}


  Future< /*Map<String, dynamic>*/ String> getExecutions(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response = await client.get('/trade/accounts/$accountId/executions');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  Future< /*Map<String, dynamic>*/ String> getState(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response = await client.get('/trade/accounts/$accountId/state');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

  Future< /*Map<String, dynamic>*/ String> getConfig(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response = await client.get('/trade/config');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }
}
