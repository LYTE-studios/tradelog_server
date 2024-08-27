import 'package:dio/dio.dart';
import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/tradelocker_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/staging_config.dart';

class TradeLockerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  late TradeLockerClient client;

  Future<void> initializeClient(Session session, {int accNum = -1}) async {
    var authenticated = await session.authenticated;
    var accessToken = await session.caches.localPrio
        .get<AccessToken>('tradelocker-${authenticated!.userId}');

    if (accessToken != null) {
      client = TradeLockerClient(
        demoTradelockerURI,
        accessToken.token,
        accNum: accNum == -1 ? '' : accNum.toString(),
      );
    } else {
      var linkedAccount = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) =>
            o.userInfoId.equals(authenticated.userId) &
            o.platform.equals(Platform.Tradelocker),
      );

      if (linkedAccount == null) {
        throw Exception('Access token not found in cache/No account linked');
      } else {
        var accessToken = AccessToken(token: linkedAccount.apiKey);

        await session.caches.localPrio
            .put('tradelocker-${authenticated.userId}', accessToken);

        client = TradeLockerClient(
          demoTradelockerURI,
          accessToken.token,
          accNum: accNum == -1 ? '' : accNum.toString(),
        );
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
      demoTradelockerURI,
      '',
    );

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
        final accessToken = data['accessToken'] as String;
        final refreshToken = data['refreshToken'] as String;

        await session.caches.localPrio.put(
            'tradelocker-${authenticated!.userId}',
            AccessToken(token: accessToken));

        var checkCred = await TradelockerCredentials.db.findFirstRow(session,
            where: (o) => o.userId.equals(authenticated.userId));

        if (checkCred == null) {
          var account = TradelockerCredentials(
            email: email,
            password: password,
            server: server,
            userId: authenticated.userId,
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

        var checkLinked = await LinkedAccount.db.findFirstRow(
          session,
          where: (o) => o.userInfoId.equals(authenticated.userId),
        );

        if (checkLinked == null) {
          var linkedAccount = LinkedAccount(
            userInfoId: authenticated.userId,
            apiKey: accessToken,
            platform: Platform.Tradelocker,
          );
          await LinkedAccount.db.insertRow(session, linkedAccount);
        } else {
          checkLinked.apiKey = accessToken;
          await LinkedAccount.db.updateRow(session, checkLinked);
        }

        return accessToken;
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

  Future< /*Map<String, dynamic>*/ String> getPositions(
      Session session, int accountId, int accNum) async {
    await initializeClient(session, accNum: accNum);

    final response = await client.get('/trade/accounts/$accountId/positions');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to load data - Error code: ${response.statusCode}');
    }
  }

}
