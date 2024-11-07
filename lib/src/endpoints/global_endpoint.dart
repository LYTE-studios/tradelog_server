import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/endpoints/metaapi_endpoint.dart';
import 'package:tradelog_server/src/endpoints/tradelocker_endpoint.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class GlobalEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<DisplayTrade>> fetchFromAPIs(Session session) async {
    var authenticated = await session.authenticated;
    if (authenticated == null) {
      throw Exception('User not authenticated');
    }

    var linkedAccounts = await LinkedAccount.db.find(
      session,
      where: (o) => o.userInfoId.equals(authenticated.userId),
    );

    var trades = <DisplayTrade>[];

    for (var account in linkedAccounts) {
      switch (account.platform) {
        case Platform.Metatrader:
          try {
            var metaTrades =
                await MetaApiEndpoint().getTrades(session, account.metaID!);
            //await MetaApiEndpoint().getTrades(session, account.metaID!);
            //print(metaTrades);
            trades.addAll(metaTrades);
          } catch (e) {
            session.log('Error fetching trades from MetaTrader: $e');
          }
          break;
        case Platform.Tradelocker:
          try {
            var tlTrades = await TradeLockerEndpoint().getAllTrades(session);
            trades.addAll(tlTrades);
          } catch (e) {
            session.log('Error fetching trades from Tradelocker: $e');
          }
          break;
      }
    }

    trades.sort((a, b) => a.openTime.compareTo(b.openTime));
    // Convert each DisplayTrade to JSON and store the JSON list in the cache
    // Wrap the trades in DisplayTradeList and store in the cache
    var tradeListWrapper = DisplayTradeList(trades: trades);
    await session.caches.localPrio.put(
      'trades-${authenticated.userId}',
      tradeListWrapper,
    );
    return trades;
  }

  Future<List<DisplayTrade>> getCachedTrades(Session session) async {
    var authenticated = await session.authenticated;

    var cachedData = await session.caches.localPrio
        .get<DisplayTradeList>('trades-${authenticated!.userId}');
    if (cachedData == null) {
      return fetchFromAPIs(session);
    }

    return cachedData.trades;
  }
}
