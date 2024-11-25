import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/endpoints/metaapi_endpoint.dart';
import 'package:tradelog_server/src/endpoints/tradelocker_endpoint.dart';
import 'package:tradelog_server/src/exceptions/general_tradely_exception.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class AccountEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> removeAccount(Session session, int accountId) async {
    AuthenticationInfo? authInfo = await session.authenticated;

    await LinkedAccount.db.deleteWhere(session,
        where: (t) =>
            t.id.equals(accountId) & t.userInfoId.equals(authInfo!.userId));
  }

  Future<List<LinkedAccountDto>> fetchAccounts(Session session) async {
    AuthenticationInfo? authInfo = await session.authenticated;

    var linkedAccounts = await LinkedAccount.db
        .find(session, where: (o) => o.userInfoId.equals(authInfo!.userId));
    if (linkedAccounts.isEmpty) {
      throw GeneralTradelyException("No linked accounts found");
    }

    List<LinkedAccountDto> linkedAccountDtos = [];

    for (var account in linkedAccounts) {
      switch (account.platform) {
        case Platform.TradelockerDemo:
        case Platform.Tradelocker:
          var details = await TradeLockerEndpoint().getAccountDto(
            session,
            account,
          );

          linkedAccountDtos.add(details);
          break;
        case Platform.Metatrader:
          if (account.metaID == null) {
            throw GeneralTradelyException(
              "MetaID not found for account: ${account.id}",
            );
          }
          var details = await MetaApiEndpoint().getAccountInformation(
            session,
            account.metaID!,
          );

          LinkedAccountDto linkedAccountDto = LinkedAccountDto(
            linkedAccountId: account.id,
            platform: account.platform,
            title: account.title,
            currency: [details.currency],
            balance: [details.balance],
          );
          linkedAccountDtos.add(linkedAccountDto);
          break;
        default:
          throw GeneralTradelyException(
            "Unknown platform: ${account.platform}",
          );
      }
    }

    return linkedAccountDtos;
  }
}
