import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class ProfileEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> updateProfile(Session session, TradelyProfile profile) async {
    await TradelyProfile.db.updateRow(session, profile);
  }

  Future<TradelyProfile> getProfile(Session session) async {
    AuthenticationInfo? info = await session.authenticated;

    assert(info?.userId != null);

    TradelyProfile? profile = (await TradelyProfile.db
            .find(session, where: (t) => t.userInfoId.equals(info!.userId)))
        .firstOrNull;

    if (profile == null) {
      UserInfo? userInfo = await UserInfo.db.findById(session, info!.userId);

      assert(userInfo != null);

      profile = TradelyProfile(
        userInfoId: userInfo!.id!,
        firstName: userInfo.fullName?.split(' ').first ?? '',
        lastName: userInfo.fullName?.split(' ').last ?? '',
      );

      await TradelyProfile.db.insertRow(session, profile);
    }

    return profile;
  }
}
