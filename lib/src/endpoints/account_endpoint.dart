import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class AccountEndpoint extends Endpoint { 
  @override
  bool get requireLogin => true;

  Future<void> linkAccount(Session session, LinkedAccount account) async { 
    var authenticatedInfo = await session.authenticated;
    if (authenticatedInfo?.userId != account.userInfoId) {
      throw FormatException("User mismatch");
    }
    await LinkedAccount.db.insertRow(session, account);
  }

  Future<void> unlinkAccount(Session session, LinkedAccount account) async { 
    await LinkedAccount.db.deleteRow(session, account);
  }
}