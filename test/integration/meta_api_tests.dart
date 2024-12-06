import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:tradelog_server/src/clients/metaapi_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:test/test.dart';
import 'package:tradelog_server/server.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('MetaApi tests', (sessionBuilder, endpoints) {
    late MetaApiAuthenticationDto authDto;
    late Session session;

    setUp(() async {
      final authenticatedSessionBuilder = sessionBuilder.copyWith(
        authentication:
            AuthenticationOverride.authenticationInfo(1, {Scope('user')}),
      );

      session = authenticatedSessionBuilder.build();

      UserInfo? userInfo = await UserInfo.db.findFirstRow(
        session,
        where: (o) => o.id.equals(1),
      );

      if (userInfo == null) {
        await UserInfo.db.insertRow(
          session,
          UserInfo(
            id: 1,
            userIdentifier: 'Test',
            created: DateTime.now(),
            scopeNames: [],
            blocked: false,
          ),
        );
      }

      authDto = MetaApiAuthenticationDto(
        login: '7510224',
        password: '3@GqD#nF',
        server: 'VantageInternational-Demo',
        platform: 'mt5',
        name: 'Test',
      );
    });

    group('MetaApiClient', () {
      test('Test account creation and deletion', () async {
        final MetaApiClient client = MetaApiClient(session);

        LinkedAccount? testAccount;

        try {
          testAccount = await client.authenticate(
            authDto: authDto,
          );

          expect(testAccount, isNotNull);

          expect(testAccount!.platform, equals(Platform.mt5));
          expect(testAccount.accountInformation, isNotEmpty);
          expect(testAccount.accountInformation['accountId'], isNotNull);

          // Verify account was saved to database
          final savedAccount = await LinkedAccount.db.findById(
            session,
            testAccount.id!,
          );

          expect(savedAccount, isNotNull);
          expect(savedAccount!.platform, equals(Platform.mt5));
        } catch (e) {
          fail('Account creation failed: $e');
        }
        try {
          await client.deleteAccount(session, testAccount);

          final deletedAccount = await LinkedAccount.db.findById(
            session,
            testAccount.id!,
          );

          expect(deletedAccount, isNull);
        } catch (e) {
          fail('Account deletion failed: $e');
        }
      });
    });
  });
}
