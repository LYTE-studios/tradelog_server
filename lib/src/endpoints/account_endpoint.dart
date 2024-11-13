import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class AccountEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<LinkedAccount>> fetchAccounts(Session session) async {
    AuthenticationInfo? authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not authenticated');
    }

    // balance
    // Title
    // Status

    return await LinkedAccount.db.find(
      session,
      where: (t) => t.userInfoId.equals(authInfo.userId),
    );
  }
}
