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
        .get<AccessToken>('metaapi-${authenticated!.userId}');

    if (accessToken != null) {
      client = MetaApiClient(
        metaApiURI,
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
            .put('tradelocker-${authenticated.userId}', accessToken);

        client = MetaApiClient(
          metaApiURI,
          accessToken.token,
        );
      }
    }
  }
  
}