import 'package:tradelog_server/src/generated/protocol.dart';

class TradeAnalyzer {
  // Method to sort trades by date
  List<TradeDto> sortTradesByDate(List<TradeDto> trades) {
    trades.sort((a, b) => a.openTime.compareTo(b.openTime));
    return trades;
  }

  // Method to calculate net profit/loss (realizedPl)
  double calculaterealizedPl(List<TradeDto> trades) {
    return trades.fold(0.0, (sum, trade) => sum + trade.realizedPl!);
  }

  // Method to calculate the trade win rate percentage
  double calculateWinRate(List<TradeDto> trades) {
    if (trades.isEmpty) return 0.0;

    int winCount = trades.where((trade) => trade.realizedPl! > 0).length;
    return (winCount / trades.length) * 100;
  }

  // Method to calculate the average risk/reward (R:R) ratio
  double calculateAverageRR(List<TradeDto> trades) {
    List<double?> winningTrades = trades
        .where((trade) => trade.realizedPl! > 0)
        .map((trade) => trade.realizedPl)
        .toList();
    List<double?> losingTrades = trades
        .where((trade) => trade.realizedPl! < 0)
        .map((trade) => trade.realizedPl?.abs())
        .toList();

    if (winningTrades.isEmpty || losingTrades.isEmpty) {
      return 0.0;
    }

    double avgWin =
        winningTrades.reduce((a, b) => a! + b!)! / winningTrades.length;
    double avgLoss =
        losingTrades.reduce((a, b) => a! + b!)! / losingTrades.length;

    // Caverage R:R ratio
    return avgWin / avgLoss;
  }

  int calculateBreakEvenTrades(List<TradeDto> trades) {
    return trades.where((trade) => trade.realizedPl == 0).length;
  }

  int calculateMaxConsecutiveLosses(List<TradeDto> trades) {
    int maxConsecutiveLosses = 0;
    int currentLossStreak = 0;

    for (var trade in trades) {
      if (trade.realizedPl! < 0) {
        currentLossStreak++;
        if (currentLossStreak > maxConsecutiveLosses) {
          maxConsecutiveLosses = currentLossStreak;
        }
      } else {
        currentLossStreak = 0; // Reset streak if a non-losing trade occurs
      }
    }

    return maxConsecutiveLosses;
  }

  double? calculateLargestProfit(List<TradeDto> trades) {
    if (trades.isEmpty) return 0.0;

    return trades
        .map((trade) => trade.realizedPl)
        .reduce((a, b) => a! > b! ? a : b);
  }

  DateTime calculateBestTradingMonth(List<TradeDto> trades) {
    Map<String, double> monthProfits = {};

    for (var trade in trades) {
      String monthKey = "${trade.openTime.year}-${trade.openTime.month}";

      if (!monthProfits.containsKey(monthKey)) {
        monthProfits[monthKey] = 0.0;
      }
      monthProfits[monthKey] = monthProfits[monthKey]! + trade.realizedPl!;
    }

    String bestMonth = monthProfits.keys
        .reduce((a, b) => monthProfits[a]! > monthProfits[b]! ? a : b);
    List<String> bestMonthParts = bestMonth.split('-');

    return DateTime(int.parse(bestMonthParts[0]), int.parse(bestMonthParts[1]));
  }

  DateTime calculateWorstTradingMonth(List<TradeDto> trades) {
    Map<String, double> monthProfits = {};

    for (var trade in trades) {
      String monthKey = "${trade.openTime.year}-${trade.openTime.month}";

      if (!monthProfits.containsKey(monthKey)) {
        monthProfits[monthKey] = 0.0;
      }
      monthProfits[monthKey] = monthProfits[monthKey]! + trade.realizedPl!;
    }

    String worstMonth = monthProfits.keys
        .reduce((a, b) => monthProfits[a]! < monthProfits[b]! ? a : b);
    List<String> worstMonthParts = worstMonth.split('-');

    return DateTime(
        int.parse(worstMonthParts[0]), int.parse(worstMonthParts[1]));
  }

  double calculateAverageTradingMonth(List<TradeDto> trades) {
    Map<String, double> monthProfits = {};

    for (var trade in trades) {
      String monthKey = "${trade.openTime.year}-${trade.openTime.month}";

      if (!monthProfits.containsKey(monthKey)) {
        monthProfits[monthKey] = 0.0;
      }
      monthProfits[monthKey] = monthProfits[monthKey]! + trade.realizedPl!;
    }

    // Calculate the average profit
    double totalProfit = monthProfits.values.reduce((a, b) => a + b);
    return totalProfit / monthProfits.length;
  }
}
