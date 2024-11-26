import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/endpoints/account_endpoint.dart';
import 'package:tradelog_server/src/endpoints/global_endpoint.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/trade_analyzer.dart';

class StatisticsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<Map<DateTime, double>> getPnlChart(Session session) async {
    Map<DateTime, double> chartMap = {};

    // Retrieve cached trades or fetch fresh data if the cache is empty
    List<TradeDto>? trades = await GlobalEndpoint().getTrades(session);

    trades.sort((a, b) => b.openTime.compareTo(a.openTime));

    double currentPnl = 0;

    for (TradeDto trade in trades) {
      DateTime date = DateTime.utc(
        trade.openTime.year,
        trade.openTime.month,
        trade.openTime.day,
      );

      currentPnl += trade.realizedPl ?? 0;

      chartMap[date] = currentPnl;
    }

    // Return calculated statistics
    return chartMap;
  }

  Future<Map<DateTime, double>> getAccountBalanceChart(
    Session session, {
    DateTime? from,
    DateTime? to,
  }) async {
    Map<DateTime, double> chartMap = {};

    // Retrieve cached trades or fetch fresh data if the cache is empty
    List<TradeDto>? trades = await GlobalEndpoint().getTrades(
      session,
      from: from,
      to: to,
    );

    trades.sort((a, b) => b.openTime.compareTo(a.openTime));

    List<LinkedAccountDto> accounts =
        await AccountEndpoint().fetchAccounts(session);

    double totalBalance = 0;

    for (LinkedAccountDto account in accounts) {
      double balance = 0;

      for (double value in account.balance ?? []) {
        balance += value;
      }

      totalBalance += balance;
    }

    for (TradeDto trade in trades) {
      DateTime date = DateTime.utc(
        trade.openTime.year,
        trade.openTime.month,
        trade.openTime.day,
      );

      totalBalance -= trade.realizedPl ?? 0;

      chartMap[date] = totalBalance;
    }

    // Return calculated statistics
    return chartMap;
  }

  Future<OverviewStatisticsDto> getOverviewStatistics(
    Session session, {
    DateTime? from,
    DateTime? to,
  }) async {
    // Retrieve cached trades or fetch fresh data if the cache is empty
    List<TradeDto>? trades = await GlobalEndpoint().getTrades(
      session,
      from: from,
      to: to,
    );

    Map<DateTime, double> chartData = await getAccountBalanceChart(session);

    // // Filter trades closed in the current month
    // final now = DateTime.now();
    // final currentMonthTrades = _filterTradesForCurrentMonth(trades, now);

    // Calculate statistics
    final netProfitLossThisMonth = _calculateNetProfitLoss(trades);
    final tradeWinRateThisMonth = _calculateTradeWinRate(trades);
    final realizedReturnThisMonth = _calculateRealizedReturn(trades);
    final shortTradesAmount = _countTradesByOption(trades, Option.short);
    final longTradesAmount = _countTradesByOption(trades, Option.long);

    // Return calculated statistics
    return OverviewStatisticsDto(
      netProfitLossThisMonth: netProfitLossThisMonth,
      tradeWinRateThisMonth: tradeWinRateThisMonth,
      realizedReturnThisMonth: realizedReturnThisMonth,
      shortTradesAmount: shortTradesAmount,
      longTradesAmount: longTradesAmount,
      equityChartData: chartData,
    );
  }

  Future<StatisticsDto> getStatistics(
    Session session, {
    DateTime? from,
    DateTime? to,
  }) async {
    // Retrieve cached trades or fetch fresh data if the cache is empty
    List<TradeDto>? trades = await GlobalEndpoint().getTrades(
      session,
      from: from,
      to: to,
    );
    // // Filter trades closed in the current month
    // final now = DateTime.now();
    // final currentMonthTrades = _filterTradesForCurrentMonth(trades, now);

    final analyzer = TradeAnalyzer();

    // Calculate statistics
    final totalPL = analyzer.calculateRealizedPl(trades);
    final averageWinningTrade = analyzer.calculateAverageWinningTrade(trades);
    final totalTrades = trades.length;
    final breakEven = analyzer.calculateBreakEvenTrades(trades);
    final consecutiveLosses = analyzer.calculateMaxConsecutiveLosses(trades);
    final largestProfit = analyzer.calculateLargestProfit(trades);
    final bestMonth = analyzer.calculateBestTradingMonth(trades);
    final worstMonth = analyzer.calculateWorstTradingMonth(trades);
    final averageMonth = analyzer.calculateAverageTradingMonth(trades);

    // Return calculated statistics
    return StatisticsDto(
      totalPL: totalPL,
      averageWinningTrade: averageWinningTrade,
      totalNumberOfTrades: totalTrades,
      numberOfBreakEvenTrades: breakEven,
      maxConsecutiveLosses: consecutiveLosses,
      largestProfit: largestProfit,
      bestTradingMonth: bestMonth,
      worstTradingMonth: worstMonth,
      averageTradingMonth: averageMonth,
    );
  }

  Future<StatisticsDto> getDiaryStatistics(
    Session session, {
    DateTime? from,
    DateTime? to,
  }) async {
    List<TradeDto>? trades = await GlobalEndpoint().getTrades(
      session,
      from: from,
      to: to,
    );

    final analyzer = TradeAnalyzer();

    final totalTrades = trades.length;
    final bestWin = analyzer.calculateLargestProfit(trades);
    final maxWinStreak = analyzer.calculateMaxWinStreak(trades);
    final averageWin = analyzer.calculateAverageWinningTrade(trades);
    //TODO: Implement the following methods in TradeAnalyzer
    //final averageWinStreak = analyzer.calculateAverageWinStreak(trades);

    return StatisticsDto(
      totalNumberOfTrades: totalTrades,
      largestProfit: bestWin,
      maxWinStreak: maxWinStreak,
      averageWinningTrade: averageWin,
    );
  }

  List<TradeDto> _filterTradesForCurrentMonth(
    List<TradeDto> trades,
    DateTime now,
  ) {
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
