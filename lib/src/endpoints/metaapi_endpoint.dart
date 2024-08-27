import 'dart:ffi';

import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/metaapi_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/staging_config.dart';

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
        metaApiURILN,
        accessToken.token,
      );
    } else {
      var linkedAccount = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) =>
            o.userInfoId.equals(authenticated.userId) &
            o.platform.equals(Platform.Metatrader),
      );

      if (linkedAccount == null) {
        throw Exception('Access token not found in cache/No account linked');
      } else {
        var accessToken = AccessToken(token: linkedAccount.apiKey);

        await session.caches.localPrio
            .put('metatrader-${authenticated.userId}', accessToken);

        client = MetaApiClient(
          metaApiURILN,
          accessToken.token,
        );
      }
    }
  }

  Future<void> authenticate(Session session, String apiKey) async {
    var authenticated = await session.authenticated;
    var accessToken = AccessToken(token: apiKey);

    try {
      var checkLinked = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) => o.userInfoId.equals(authenticated?.userId),
      );

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

      await session.caches.localPrio.put(
          'metatrader-${authenticated!.userId}', AccessToken(token: apiKey));
    } catch (e) {
      throw Exception('Failed to authenticate - Error: $e');
    }
  }

  Future<MetaTradingAccountInformation> getAccountInformation(Session session, String accountId) async {
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

  Future<String> getPositions(Session session, String accountId) async {
    await initializeClient(session);

    final response =
        await client.get('/users/current/accounts/$accountId/positions');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to fetch positions - Error code: ${response.statusCode}');
    }
  }

  Future<String> getOrders(Session session, String accountId) async {
    await initializeClient(session);

    final response =
        await client.get('/users/current/accounts/$accountId/orders');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to fetch orders - Error code: ${response.statusCode}');
    }
  }

  Future<String> getHistoryOrdersByTime(
      Session session, String accountId, String startTime, String endTime) async {
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
