import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/tradelocker_client.dart';
import 'package:tradelog_server/src/exceptions/general_tradely_exception.dart';
import 'package:tradelog_server/src/exceptions/network_tradely_exception.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/extensions/trade_extension.dart';
import 'package:tradelog_server/src/extensions/tradelocker_extension.dart';
import 'package:tradelog_server/src/util/request_queue.dart';
import 'package:tradelog_server/src/util/configuration.dart';

class TradeLockerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  late TradeLockerClient client;

  Future<void> initializeClient(
    Session session, {
    required String url,
    required String apiKey,
    required String refreshToken,
  }) async {
    client = TradeLockerClient(
      url,
      apiKey: apiKey,
      refreshToken: refreshToken,
    );
  }

  Future<String> authenticate(
    Session session,
    String email,
    String password,
    String server, {
    String? title,
    required bool isDemo,
  }) async {
    var authenticated = await session.authenticated;

    String url = isDemo
        ? Configuration.tradelockerDemoURI
        : Configuration.tradelockerURI;

    client = TradeLockerClient(
      url,
      apiKey: '',
      refreshToken: '',
    );

    // Step 1: Perform authentication
    final data = await _performAuthentication(
      session,
      client,
      email,
      password,
      server,
    );

    final accessToken = data['accessToken'] as String;
    final refreshToken = data['refreshToken'] as String;

    // Step 2: Store tokens and update credentials in the database
    await _storeTokens(
      session,
      authenticated!.userId,
      accessToken,
      refreshToken,
      email,
      password,
      server,
    );

    // Step 3: Manage Linked Account
    await _manageLinkedAccount(
      session,
      url: isDemo
          ? Configuration.tradelockerDemoURI
          : Configuration.tradelockerURI,
      userId: authenticated.userId,
      apiKey: accessToken,
      refreshToken: refreshToken,
      email: email,
      title: title,
    );

    return accessToken;
  }

  Future<LinkedAccount> refresh(
    Session session, {
    required String apiKey,
  }) async {
    var authenticated = await session.authenticated;

    assert(authenticated != null);

    // Find linked accounts associated with the current credentials
    var linkedAccount = await LinkedAccount.db.findFirstRow(
      session,
      where: (o) =>
          o.apiKey.equals(apiKey) & o.userInfoId.equals(authenticated!.userId),
    );

    if (linkedAccount == null) {
      throw GeneralTradelyException(
        'Linked account not found for credentials with userID: ${authenticated!.userId}',
      );
    }

    await initializeClient(
      session,
      url: linkedAccount.apiUrl,
      apiKey: "",
      refreshToken: "",
    );

    final response = await client.post(
      session,
      '/auth/jwt/refresh',
      {
        'refreshToken': linkedAccount.refreshToken,
      },
    );

    if (response.statusCode == 201) {
      final data = response.data as Map<String, dynamic>;
      final newAccessToken = data['accessToken'] as String;

      // Update the access token for each linked account related to the current credentials
      linkedAccount.apiKey = newAccessToken;
      await LinkedAccount.db.updateRow(session, linkedAccount);

      return linkedAccount;
    } else {
      throw NetworkTradelyException(response);
    }
  }

  Future<List<TradeDto>> getAllTrades(
    Session session, {
    DateTime? from,
    DateTime? to,
  }) async {
    // Ensure the user is authenticated
    var authenticated = await session.authenticated;

    // Fetch linked accounts for the user with platform == Platform.Tradelocker
    var linkedAccounts = await LinkedAccount.db.find(
      session,
      where: (o) =>
          o.userInfoId.equals(authenticated!.userId) &
          o.platform.equals(Platform.Tradelocker),
    );

    List<TradeDto> allTrades = [];

    for (var linkedAccount in linkedAccounts) {
      if (linkedAccount.tradelockerAccountId == null ||
          linkedAccount.tradelockerAccounts == null) {
        throw GeneralTradelyException('No subaccounts found');
      }

      String apiKey = linkedAccount.apiKey;
      String refreshToken = linkedAccount.refreshToken;

      initializeClient(
        session,
        url: linkedAccount.apiUrl,
        apiKey: apiKey,
        refreshToken: refreshToken,
      );

      final accountIds = linkedAccount.tradelockerAccountId!;
      final accountNumbers = linkedAccount.tradelockerAccounts!;

      // Ensure accountIds and accountNumbers have the same length
      if (accountIds.length != accountNumbers.length) {
        throw GeneralTradelyException(
          'Mismatch between account IDs and account numbers',
        );
      }

      for (int i = 0; i < accountIds.length; i++) {
        var accountId = int.parse(accountIds[i]);
        var accountNumber = int.parse(accountNumbers[i]);

        // Call getTrades for this account
        List<TradeDto> trades = await _getTrades(
          session,
          accountId: accountId,
          accNum: accountNumber,
          from: from,
          to: to,
        );

        allTrades.addAll(trades);
      }
    }

    // Optionally, sort the trades by openTime
    allTrades.sort((a, b) => a.openTime.compareTo(b.openTime));

    return allTrades;
  }

  Future<List<TradeDto>> _getTrades(
    Session session, {
    required int accountId,
    required int accNum,
    DateTime? from,
    DateTime? to,
  }) async {
    // Fetch positions and orders from the external API (rate-limited)
    final positions = await _getPositionsWithRateLimit(
      session,
      accountId: accountId,
      accNum: accNum,
      from: from,
      to: to,
    );

    final orders = await _getOrdersHistoryWithRateLimit(
      session,
      accountId: accountId,
      accNum: accNum,
      from: from,
      to: to,
    );

    // Map orders to their respective positions
    final Map<String, List<TradelockerOrder>> ordersByPosition =
        _groupOrdersByPosition(orders);

    // Set of position IDs from open positions
    final openPositionIds = positions.map((position) => position.id).toSet();

    final List<TradeDto> trades = await _processPositions(
      session,
      positions,
      ordersByPosition,
      accNum,
    );

    // Return the combined list of open and closed trades
    return trades;
  }

  /// Private Helper Functions

  Future<List<TradeDto>> _processPositions(
    Session session,
    List<TradelockerPosition> positions,
    Map<String, List<TradelockerOrder>> ordersByPosition,
    int accNum,
  ) async {
    final List<TradeDto> trades = [];

    for (TradelockerPosition position in positions) {
      TradeDto dto = TradeExtension.fromTradeLocker(position, ordersByPosition);

      trades.add(dto);
    }

    // print(trades);
    return trades;
  }

  Map<String, List<TradelockerOrder>> _groupOrdersByPosition(
    List<TradelockerOrder> orders,
  ) {
    final Map<String, List<TradelockerOrder>> ordersByPosition = {};

    for (var order in orders) {
      if (order.positionId != null) {
        ordersByPosition.putIfAbsent(order.positionId!, () => []).add(order);
      }
    }

    return ordersByPosition;
  }

  Future<List<TradelockerPosition>> _getPositionsWithRateLimit(
    Session session, {
    required int accountId,
    required int accNum,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final response = await client.get(
        session,
        '/trade/accounts/$accountId/positions',
        accNum: accNum,
        extraHeaders: {
          "from": from?.millisecondsSinceEpoch,
          "to": to?.millisecondsSinceEpoch,
        },
      );

      if (response.data == null || response.data['d'] == null) {
        throw NetworkTradelyException(
          response,
        );
      }

      final positions = response.data['d']['positions'] as List<dynamic>;
      return positions
          .map(
            (position) => TradeLockerExtension.positionFromJson(
              position as List<dynamic>,
            ),
          )
          .toList();
    } on DioException catch (e) {
      if (e.response != null) {
        throw NetworkTradelyException(e.response!);
      } else {
        throw GeneralTradelyException(
          'Something went wrong processing Positions for Tradelocker',
        );
      }
    }
  }

  Future<Map<String, dynamic>> getRawOrders(
    Session session,
    LinkedAccount account,
  ) async {
    Map<String, dynamic> map = {};

    map['config'] = await client.get(session, '/trade/config');

    List<TradelockerAccountInformation> accounts = await _getAccounts(
      session,
    );

    map['orders'] = await client.get(
      session,
      '/trade/accounts/${accounts.first.id}/ordersHistory',
    );

    return map;
  }

  Future<List<TradelockerOrder>> _getOrdersHistoryWithRateLimit(
    Session session, {
    required int accountId,
    required int accNum,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final response = await client.get(
        session,
        '/trade/accounts/$accountId/ordersHistory',
        accNum: accNum,
        extraHeaders: {
          "from": from?.millisecondsSinceEpoch,
          "to": to?.millisecondsSinceEpoch,
        },
      );

      // Check if the response is valid and contains the expected data
      if (response.data == null || response.data['d'] == null) {
        throw NetworkTradelyException(response);
      }

      // Extract and process the orders
      final orders = response.data['d']['ordersHistory'] as List<dynamic>?;
      if (orders == null) {
        throw GeneralTradelyException('No orders found in the response.');
      }

      return orders
          .map((order) =>
              TradeLockerExtension.orderFromJson(order as List<dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response != null) {
        throw NetworkTradelyException(e.response!);
      } else {
        throw GeneralTradelyException(
          'Something went wrong processing Positions for Tradelocker',
        );
      }
    }
  }

  Future<Map<String, dynamic>> _performAuthentication(
    Session session,
    TradeLockerClient client,
    String email,
    String password,
    String server,
  ) async {
    final response = await client.post(
      session,
      '/auth/jwt/token',
      {
        'email': email,
        'password': password,
        'server': server,
      },
    );

    if (response.statusCode == 201) {
      return response.data as Map<String, dynamic>;
    } else {
      throw NetworkTradelyException(response);
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
      throw GeneralTradelyException('Failed to store access token: $e');
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
      throw GeneralTradelyException('Failed to store/update credentials: $e');
    }
  }

  Future<void> _manageLinkedAccount(
    Session session, {
    required String url,
    required int userId,
    required String apiKey,
    required String refreshToken,
    required String email,
    required String? title,
  }) async {
    var creds = await TradelockerCredentials.db.findFirstRow(
      session,
      where: (o) => o.email.equals(email),
    );

    if (creds == null) {
      throw GeneralTradelyException('Credentials not found');
    }

    await initializeClient(
      session,
      url: url,
      apiKey: apiKey,
      refreshToken: refreshToken,
    );

    final accounts = await _getAccounts(
      session,
    );

    List<String> accountIds = accounts.map((x) => x.id).toList();
    List<String> accountNumbers = accounts.map((x) => x.accNum).toList();

    var linkedAccount = LinkedAccount(
      userInfoId: userId,
      apiUrl: url,
      apiKey: apiKey,
      refreshToken: creds.refreshToken ?? "",
      platform: Platform.Tradelocker,
      tradelockerCredentialsId: creds.id,
      tradelockerAccountId: accountIds,
      tradelockerAccounts: accountNumbers,
      title: title,
    );

    await LinkedAccount.db.insertRow(session, linkedAccount);
  }

  Future<List<TradelockerAccountInformation>> _getAccounts(
    Session session,
  ) async {
    final accountsFuture = Completer<List<TradelockerAccountInformation>>();
    try {
      final response = await client.get(
        session,
        '/auth/jwt/all-accounts',
      );

      // Check if 'accounts' key exists in the response data
      if (response.data == null || !response.data.containsKey('accounts')) {
        throw Exception('Missing accounts key in response');
      }

      var accountsData = response.data['accounts'];

      // Map accounts data to TradelockerAccountInformation objects
      accountsFuture.complete(
        List<TradelockerAccountInformation>.from(
          accountsData.map(
            (x) => TradelockerAccountInformation.fromJson(x),
          ),
        ),
      );
    } catch (e) {
      // Log the error before completing with an error
      print("Error occurred in getAccounts: $e");
      accountsFuture.completeError(e); // Complete with error if it fails
    }

    return await accountsFuture.future;
  }

  Future<void> reauthenticate(
    Session session,
  ) async {
    var authenticated = await session.authenticated;

    client = TradeLockerClient(
      Configuration.tradelockerURI,
      apiKey: '',
      refreshToken: '',
    );

    var linkedAccounts = await LinkedAccount.db.find(
      session,
      where: (o) => o.userInfoId.equals(authenticated!.userId),
    );

    if (linkedAccounts.isEmpty) {
      throw Exception('No linked accounts found for this user');
    }

    // Step 1: Perform authentication
    for (var account in linkedAccounts) {
      var creds = await TradelockerCredentials.db.findFirstRow(
        session,
        where: (o) => o.id.equals(account.tradelockerCredentialsId),
      );

      if (creds == null) {
        throw Exception(
          'Credentials not found for linked account ${account.id}',
        );
      }

      final data = await _performAuthentication(
          session, client, creds.email, creds.password, creds.server);

      final accessToken = data['accessToken'] as String;
      final refreshToken = data['refreshToken'] as String;

      // Step 2: Store tokens and update credentials in the database
      await _storeTokens(
        session,
        authenticated!.userId,
        accessToken,
        refreshToken,
        creds.email,
        creds.password,
        creds.server,
      );

      // Step 3: Manage Linked Account
      await _manageLinkedAccount(
        session,
        url: account.apiUrl,
        userId: authenticated.userId,
        apiKey: accessToken,
        refreshToken: refreshToken,
        email: creds.email,
        title: account.title,
      );
    }
  }
}
