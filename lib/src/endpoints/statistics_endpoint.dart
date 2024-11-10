import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class StatisticsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<OverviewStatistics> getOverviewStatistics(Session session) async {
    // TODO
    return OverviewStatistics(
      netProfitLossThisMonth: null,
      tradeWinRateThisMonth: null,
      realizedReturnThisMonth: null,
      shortTradesAmount: null,
      longTradesAmount: null,
    );
  }
}
