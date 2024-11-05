import 'package:tradelog_server/src/generated/protocol.dart';

class TradeAnalyzer {
  // Method to sort trades by date
  List<DisplayTrade> sortTradesByDate(List<DisplayTrade> trades) {
    trades.sort((a, b) => a.openTime.compareTo(b.openTime));
    return trades;
  }

  // Method to calculate net profit/loss (netpl)
  double calculateNetPL(List<DisplayTrade> trades) {
    return trades.fold(0.0, (sum, trade) => sum + trade.netpl);
  }

  // Method to calculate the trade win rate percentage
  double calculateWinRate(List<DisplayTrade> trades) {
    if (trades.isEmpty) return 0.0;

    int winCount = trades.where((trade) => trade.netpl > 0).length;
    return (winCount / trades.length) * 100;
  }

  // Method to calculate the average risk/reward (R:R) ratio
  double calculateAverageRR(List<DisplayTrade> trades) {
    List<double> winningTrades = trades
        .where((trade) => trade.netpl > 0)
        .map((trade) => trade.netpl)
        .toList();
    List<double> losingTrades = trades
        .where((trade) => trade.netpl < 0)
        .map((trade) => trade.netpl.abs())
        .toList();

    if (winningTrades.isEmpty || losingTrades.isEmpty) {
      return 0.0;
    }

    double avgWin =
        winningTrades.reduce((a, b) => a + b) / winningTrades.length;
    double avgLoss = losingTrades.reduce((a, b) => a + b) / losingTrades.length;

    // Caverage R:R ratio
    return avgWin / avgLoss;
  }

  int calculateBreakEvenTrades(List<DisplayTrade> trades) {
    return trades.where((trade) => trade.netpl == 0).length;
  }

  int calculateMaxConsecutiveLosses(List<DisplayTrade> trades) {
    int maxConsecutiveLosses = 0;
    int currentLossStreak = 0;

    for (var trade in trades) {
      if (trade.netpl < 0) {
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

  double calculateLargestProfit(List<DisplayTrade> trades) {
    if (trades.isEmpty) return 0.0;

    return trades.map((trade) => trade.netpl).reduce((a, b) => a > b ? a : b);
  }

  DateTime calculateBestTradingMonth(List<DisplayTrade> trades) {
    Map<String, double> monthProfits = {};

    for (var trade in trades) {
      String monthKey = "${trade.openTime.year}-${trade.openTime.month}";

      if (!monthProfits.containsKey(monthKey)) {
        monthProfits[monthKey] = 0.0;
      }
      monthProfits[monthKey] = monthProfits[monthKey]! + trade.netpl;
    }

    String bestMonth = monthProfits.keys
        .reduce((a, b) => monthProfits[a]! > monthProfits[b]! ? a : b);
    List<String> bestMonthParts = bestMonth.split('-');

    return DateTime(int.parse(bestMonthParts[0]), int.parse(bestMonthParts[1]));
  }

  DateTime calculateWorstTradingMonth(List<DisplayTrade> trades) {
    Map<String, double> monthProfits = {};

    for (var trade in trades) {
      String monthKey = "${trade.openTime.year}-${trade.openTime.month}";

      if (!monthProfits.containsKey(monthKey)) {
        monthProfits[monthKey] = 0.0;
      }
      monthProfits[monthKey] = monthProfits[monthKey]! + trade.netpl;
    }

    String worstMonth = monthProfits.keys
        .reduce((a, b) => monthProfits[a]! < monthProfits[b]! ? a : b);
    List<String> worstMonthParts = worstMonth.split('-');

    return DateTime(
        int.parse(worstMonthParts[0]), int.parse(worstMonthParts[1]));
  }

  double calculateAverageTradingMonth(List<DisplayTrade> trades) {
    Map<String, double> monthProfits = {};

    for (var trade in trades) {
      String monthKey = "${trade.openTime.year}-${trade.openTime.month}";

      if (!monthProfits.containsKey(monthKey)) {
        monthProfits[monthKey] = 0.0;
      }
      monthProfits[monthKey] = monthProfits[monthKey]! + trade.netpl;
    }

    // Calculate the average profit
    double totalProfit = monthProfits.values.reduce((a, b) => a + b);
    return totalProfit / monthProfits.length;
  }
}
