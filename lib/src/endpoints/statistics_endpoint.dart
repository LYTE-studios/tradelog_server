import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class StatisticsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<OverviewStatistics> getOverviewStatistics(Session session) async {
    // TODO
    return OverviewStatistics(
      netProfitLossThisMonth: 0,
      tradeWinRateThisMonth: 0,
      realizedReturnThisMonth: 0,
      shortTradesAmount: 0,
      longTradesAmount: 0,
    );
  }
}
