import 'dart:ffi';

import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/metaapi_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/configuration.dart';
import 'package:tradelog_server/src/models/trade_extension.dart'
    show TradeExtension;

class MetaApiEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  late MetaApiClient client;

  /// Initializes the MetaApiClient using an access token from the session cache.
  /// If no access token is found, retrieves it from the linked account.
  /// Throws an exception if no linked account is found or if there's an error during initialization.
  Future<void> initializeClient(Session session, {int accNum = -1}) async {
    var authenticated = await session.authenticated;
    var accessToken = await session.caches.localPrio
        .get<AccessToken>('metatrader-${authenticated!.userId}');

    if (accessToken != null) {
      client = MetaApiClient(
        Configuration.metaApiURILN,
        accessToken.token,
      );
      return;
    }

    var linkedAccount = await LinkedAccount.db.findFirstRow(
      session,
      where: (o) =>
          o.userInfoId.equals(authenticated.userId) &
          o.platform.equals(Platform.Metatrader),
    );

    if (linkedAccount == null) {
      throw Exception('Access token not found in cache/No account linked');
    }

    accessToken = AccessToken(token: linkedAccount.apiKey);

    await session.caches.localPrio
        .put('metatrader-${authenticated.userId}', accessToken);

    client = MetaApiClient(
      Configuration.metaApiURILN,
      accessToken.token,
    );
  }

  /// Authenticates the user by storing the provided API key and linking it to the user's account.
  /// If a linked account exists, it updates the API key. Otherwise, it inserts a new linked account.
  /// Caches the access token after authentication.
  Future<void> authenticate(
      Session session, String apiKey, String metaId) async {
    var authenticated = await session.authenticated;
    var accessToken = AccessToken(token: apiKey);

    // Check if a linked account exists for this user on the MetaTrader platform
    LinkedAccount? checkLinked;
    try {
      checkLinked = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) =>
            o.userInfoId.equals(authenticated!.userId) &
            o.platform.equals(Platform.Metatrader),
      );
    } catch (e) {
      throw Exception(
          'Database error while checking linked account - Error: $e');
    }

    // Insert or update the linked account, setting the metaId
    try {
      if (checkLinked == null) {
        var linkedAccount = LinkedAccount(
          userInfoId: authenticated!.userId,
          apiKey: apiKey,
          platform: Platform.Metatrader,
          metaID: metaId, // Set the metaId here
        );
        await LinkedAccount.db.insertRow(session, linkedAccount);
      } else {
        checkLinked.apiKey = apiKey;
        checkLinked.metaID =
            metaId; // Update the metaId here if it already exists
        await LinkedAccount.db.updateRow(session, checkLinked);
      }
    } catch (e) {
      throw Exception(
          'Database error while inserting/updating linked account - Error: $e');
    }

    // Cache the access token
    try {
      await session.caches.localPrio
          .put('metatrader-${authenticated!.userId}', accessToken);
    } catch (e) {
      throw Exception('Error caching access token - Error: $e');
    }
  }

  /// Retrieves the account information for the specified MetaTrader account.
  /// Initializes the MetaApiClient if not already initialized.
  /// Returns a [MetaTradingAccountInformation] object if successful, otherwise throws an exception.
  Future<MetaTradingAccountInformation> getAccountInformation(
      Session session, String accountId) async {
    await initializeClient(session);

    final response = await client
        .get('/users/current/accounts/$accountId/account-information');
    if (response.statusCode == 200) {
      try {
        return MetaTradingAccountInformation.fromJson(response.data);
      } catch (e) {
        throw Exception('Failed to parse account information - Error: $e');
      }
    } else {
      throw Exception(
          'Failed to fetch account information - Error code: ${response.statusCode}');
    }
  }

  /// Retrieves the list of open positions for the specified MetaTrader account.
  /// Initializes the MetaApiClient if not already initialized.
  /// Returns a list of [MetatraderPosition] objects if successful, otherwise throws an exception.
  Future<List<MetatraderPosition>> getPositions(
      Session session, String accountId) async {
    await initializeClient(session);

    final response =
        await client.get('/users/current/accounts/$accountId/positions');
    if (response.statusCode == 200) {
      return List<MetatraderPosition>.from(
          response.data.map((x) => MetatraderPosition.fromJson(x)));
    } else {
      throw Exception(
          'Failed to fetch positions - Error code: ${response.statusCode}');
    }
  }

  Future<List<DisplayTrade>> getTrades(
      Session session, String accountId) async {
    await initializeClient(session);

    final response =
        await client.get('/users/current/accounts/$accountId/positions');
    if (response.statusCode == 200) {
      var positions = List<MetatraderPosition>.from(
          response.data.map((x) => MetatraderPosition.fromJson(x)));
      var trades = <DisplayTrade>[];
      for (var position in positions) {
        trades.add(TradeExtension.fromMetaTrader(position));
      }
      return trades;
    } else {
      throw Exception(
          'Failed to fetch trades - Error code: ${response.statusCode}');
    }
  }

  /// Retrieves the list of open orders for the specified MetaTrader account.
  /// Initializes the MetaApiClient if not already initialized.
  /// Returns a list of [MetatraderOrder] objects if successful, otherwise throws an exception.
  Future<List<MetatraderOrder>> getOrders(
      Session session, String accountId) async {
    await initializeClient(session);

    final response =
        await client.get('/users/current/accounts/$accountId/orders');
    if (response.statusCode == 200) {
      return List<MetatraderOrder>.from(
          response.data.map((x) => MetatraderPosition.fromJson(x)));
    } else {
      throw Exception(
          'Failed to fetch orders - Error code: ${response.statusCode}');
    }
  }

  /// Retrieves the history of orders for the specified MetaTrader account within the given time range.
  /// Initializes the MetaApiClient if not already initialized.
  /// Returns the history orders as a string if successful, otherwise throws an exception.
  Future<String> getHistoryOrdersByTime(Session session, String accountId,
      String startTime, String endTime) async {
    await initializeClient(session);

    final response = await client.get(
        '/users/current/accounts/$accountId/history-orders/time/$startTime/$endTime');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to fetch history orders - Error code: ${response.statusCode}');
    }
  }
}
