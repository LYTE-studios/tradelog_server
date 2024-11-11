import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/endpoints/global_endpoint.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class StatisticsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<OverviewStatistics> getOverviewStatistics(Session session) async {
    // Retrieve cached trades or fetch fresh data if the cache is empty
    List<TradeDto>? trades = await GlobalEndpoint().getTrades(session);

    // Filter trades closed in the current month
    final now = DateTime.now();
    final currentMonthTrades = _filterTradesForCurrentMonth(trades, now);

    // Calculate statistics
    final netProfitLossThisMonth = _calculateNetProfitLoss(currentMonthTrades);
    final tradeWinRateThisMonth = _calculateTradeWinRate(currentMonthTrades);
    final realizedReturnThisMonth =
        _calculateRealizedReturn(currentMonthTrades);
    final shortTradesAmount =
        _countTradesByOption(currentMonthTrades, Option.short);
    final longTradesAmount =
        _countTradesByOption(currentMonthTrades, Option.long);

    // Return calculated statistics
    return OverviewStatistics(
      netProfitLossThisMonth: netProfitLossThisMonth,
      tradeWinRateThisMonth: tradeWinRateThisMonth,
      realizedReturnThisMonth: realizedReturnThisMonth,
      shortTradesAmount: shortTradesAmount,
      longTradesAmount: longTradesAmount,
    );
  }

  List<TradeDto> _filterTradesForCurrentMonth(
      List<TradeDto> trades, DateTime now) {
    return trades
        .where((trade) =>
            trade.status == TradeStatus.closed &&
            trade.openTime.year == now.year &&
            trade.openTime.month == now.month)
        .toList();
  }

  double _calculateNetProfitLoss(List<TradeDto> trades) {
    return trades.fold(0.0, (sum, trade) => sum + (trade.realizedPl ?? 0.0));
  }

  double? _calculateTradeWinRate(List<TradeDto> trades) {
    final totalClosedTrades = trades.length;
    if (totalClosedTrades == 0) return null;

    final winningTrades =
        trades.where((trade) => (trade.realizedPl ?? 0.0) > 0).length;
    return (winningTrades / totalClosedTrades) * 100;
  }

  double? _calculateRealizedReturn(List<TradeDto> trades) {
    if (trades.isEmpty) return null;

    double totalReturn = 0.0;
    int countedTrades = 0;

    for (var trade in trades) {
      final investment = trade.lotSize * (trade.stopLoss ?? 0);
      if (investment != 0) {
        totalReturn += (trade.realizedPl ?? 0) / investment * 100;
        countedTrades++;
      }
    }

    return countedTrades > 0 ? totalReturn / countedTrades : null;
  }

  int _countTradesByOption(List<TradeDto> trades, Option option) {
    return trades.where((trade) => trade.option == option).length;
  }
}
