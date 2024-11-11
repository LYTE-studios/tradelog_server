import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';
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

  Future<void> initializeClient(
    Session session, {
    required String apiKey,
    required String refreshToken,
  }) async {
    client = TradeLockerClient(
      Configuration.tradelockerURI,
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
  }) async {
    var authenticated = await session.authenticated;

    client = TradeLockerClient(
      Configuration.tradelockerURI,
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
      userId: authenticated.userId,
      apiKey: accessToken,
      refreshToken: refreshToken,
      email: email,
      title: title,
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

    await initializeClient(
      session,
      apiKey: "",
      refreshToken: "",
    );

    // Iterate over each set of credentials and refresh tokens
    for (var creds in credentialsList) {
      requestQueue.addRequest(
        EndpointRequest(
            priority: 1,
            request: () async {
              try {
                final response = await client.post(
                  session,
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

  Future<List<TradeDto>> getAllTrades(Session session) async {
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
        throw Exception('No subaccounts found');
      }

      String apiKey = linkedAccount.apiKey;
      String refreshToken = linkedAccount.refreshToken;

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
          List<TradeDto> trades = await _getTrades(
            session,
            apiKey: apiKey,
            refreshToken: refreshToken,
            accountId: accountId,
            accNum: accountNumber,
          );

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

  Future<List<TradeDto>> _getTrades(
    Session session, {
    required String apiKey,
    required refreshToken,
    required int accountId,
    required int accNum,
  }) async {
    // Initialize client for the current session
    await initializeClient(
      session,
      apiKey: apiKey,
      refreshToken: refreshToken,
    );

    // Fetch positions and orders from the external API (rate-limited)
    final positions = await _getPositionsWithRateLimit(
      session,
      apiKey: apiKey,
      refreshToken: refreshToken,
      accountId: accountId,
      accNum: accNum,
    );

    final orders = await getOrdersHistoryWithRateLimit(
      session,
      apiKey: apiKey,
      refreshToken: refreshToken,
      accountId: accountId,
      accNum: accNum,
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
      List<TradelockerOrder> orders) {
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
    required String apiKey,
    required String refreshToken,
    required int accountId,
    required int accNum,
  }) async {
    await initializeClient(
      session,
      apiKey: apiKey,
      refreshToken: refreshToken,
    );

    try {
      final response = await client.get(
        session,
        '/trade/accounts/$accountId/positions',
        accNum: accNum,
      );

      if (response.data == null || response.data['d'] == null) {
        throw Exception('Trade response invalid: ${response.statusMessage}');
      }

      final positions = response.data['d']['positions'] as List<dynamic>;
      return positions
          .map(
            (position) => TradeLockerExtension.positionFromJson(
              position as List<dynamic>,
            ),
          )
          .toList();
    } catch (e) {
      // Send to Sentry for monitoring
      Sentry.captureException(e);

      rethrow;
    }
  }

  Future<Map<String, dynamic>> getRawOrders(
      Session session, LinkedAccount account) async {
    Map<String, dynamic> map = {};

    map['config'] = await client.get(session, '/trade/config');

    List<TradelockerAccountInformation> accounts = await getAccounts(
      session,
      apiKey: account.apiKey,
      refreshToken: account.refreshToken,
    );

    map['orders'] = await client.get(
      session,
      '/trade/accounts/${accounts.first.id}/ordersHistory',
    );

    return map;
  }

  Future<List<TradelockerOrder>> getOrdersHistoryWithRateLimit(
    Session session, {
    required String apiKey,
    required String refreshToken,
    required int accountId,
    required int accNum,
  }) async {
    await initializeClient(
      session,
      apiKey: apiKey,
      refreshToken: refreshToken,
    );

    try {
      final response = await client.get(
        session,
        '/trade/accounts/$accountId/ordersHistory',
        accNum: accNum,
      );

      // Check if the response is valid and contains the expected data
      if (response.data == null || response.data['d'] == null) {
        // print(response.data); // uncomment if random error
        throw Exception('Invalid response or no data found.');
      }

      // Extract and process the orders
      final orders = response.data['d']['ordersHistory'] as List<dynamic>?;
      if (orders == null) {
        throw Exception('No orders found in the response.');
      }

      return orders
          .map((order) =>
              TradeLockerExtension.orderFromJson(order as List<dynamic>))
          .toList();
    } catch (e) {
      // Send to Sentry for monitoring
      Sentry.captureException(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _performAuthentication(
    Session session,
    TradeLockerClient client,
    String email,
    String password,
    String server,
  ) async {
    final authFuture = Completer<Map<String, dynamic>>();

    try {
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
        final data = response.data as Map<String, dynamic>;
        authFuture.complete(data);
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

    return await authFuture.future;
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
    Session session, {
    required int userId,
    required String apiKey,
    required String refreshToken,
    required String email,
    required String? title,
  }) async {
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

      final accounts = await getAccounts(
        session,
        apiKey: apiKey,
        refreshToken: refreshToken,
      );

      List<String> accountIds = accounts.map((x) => x.id).toList();
      List<String> accountNumbers = accounts.map((x) => x.accNum).toList();

      if (checkLinked == null) {
        var linkedAccount = LinkedAccount(
          userInfoId: userId,
          apiKey: apiKey,
          refreshToken: creds.refreshToken ?? "",
          platform: Platform.Tradelocker,
          tradelockerCredentialsId: creds.id,
          tradelockerAccountId: accountIds,
          tradelockerAccounts: accountNumbers,
          title: title,
        );
        await LinkedAccount.db.insertRow(session, linkedAccount);
      } else {
        checkLinked.apiKey = apiKey;
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
    Session session, {
    required String apiKey,
    required String refreshToken,
  }) async {
    await initializeClient(
      session,
      apiKey: apiKey,
      refreshToken: refreshToken,
    );

    final accountsFuture = Completer<List<TradelockerAccountInformation>>();
    requestQueue.addRequest(
      EndpointRequest(
        priority: 1,
        request: () async {
          try {
            final response = await client.get(
              session,
              '/auth/jwt/all-accounts',
            );

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
            'Credentials not found for linked account ${account.id}');
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
        userId: authenticated.userId,
        apiKey: accessToken,
        refreshToken: refreshToken,
        email: creds.email,
        title: account.title,
      );
    }
  }
}
