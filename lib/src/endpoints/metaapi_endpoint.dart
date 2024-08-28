import 'dart:ffi';

import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/metaapi_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/configuration.dart';

class MetaApiEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  late MetaApiClient client;

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

  Future<void> authenticate(Session session, String apiKey) async {
    var authenticated = await session.authenticated;
    var accessToken = AccessToken(token: apiKey);

    // Check if linked account exists
    LinkedAccount? checkLinked;
    try {
      checkLinked = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) => o.userInfoId.equals(authenticated!.userId),
      );
    } catch (e) {
      throw Exception(
          'Database error while checking linked account - Error: $e');
    }

    // Insert or update the linked account
    try {
      if (checkLinked == null) {
        var linkedAccount = LinkedAccount(
          userInfoId: authenticated!.userId,
          apiKey: apiKey,
          platform: Platform.Tradelocker,
        );
        await LinkedAccount.db.insertRow(session, linkedAccount);
      } else {
        checkLinked.apiKey = apiKey;
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
