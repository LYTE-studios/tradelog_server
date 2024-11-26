import 'package:tradelog_server/src/generated/protocol.dart';

class TradeAnalyzer {
  // Method to sort trades by date
  List<TradeDto> sortTradesByDate(List<TradeDto> trades) {
    trades.sort((a, b) => a.openTime.compareTo(b.openTime));
    return trades;
  }

  // Method to calculate net profit/loss (realizedPl)
  double calculateRealizedPl(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0.0;
    }

    return trades.fold(0.0, (sum, trade) => sum + trade.realizedPl!);
  }

  // Method to calculate the trade win rate percentage
  double calculateWinRate(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0.0;
    }

    int winCount = trades.where((trade) => trade.realizedPl! > 0).length;
    return (winCount / trades.length) * 100;
  }

  // Method to calculate the average risk/reward (R:R) ratio
  double calculateAverageRR(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0.0;
    }
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

    return avgWin / avgLoss;
  }

  int calculateBreakEvenTrades(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0;
    }
    return trades.where((trade) => trade.realizedPl == 0).length;
  }

  int calculateMaxConsecutiveLosses(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0;
    }

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

  int calculateMaxWinStreak(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0;
    }
    int maxWinStreak = 0;
    int currentWinStreak = 0;

    for (var trade in trades) {
      if (trade.realizedPl! > 0) {
        currentWinStreak++;
        if (currentWinStreak > maxWinStreak) {
          maxWinStreak = currentWinStreak;
        }
      } else {
        currentWinStreak = 0; // Reset streak if a non-losing trade occurs
      }
    }

    return maxWinStreak;
  }

  //TODO: Implement calculateAverageWinStreak
  // double calculateAverageWinStreak(List<TradeDto> trades) {
  //   List<int> winStreaks = [];
  //   int currentWinStreak = 0;

  //   for (var trade in trades) {
  //     if (trade.realizedPl! > 0) {
  //       currentWinStreak++;
  //     } else {
  //       if (currentWinStreak > 0) {
  //         winStreaks.add(currentWinStreak);
  //         currentWinStreak = 0;
  //       }
  //     }
  //   }

  //   if (winStreaks.isEmpty) return 0.0;

  //   double totalWinStreaks = winStreaks.reduce((a, b) => a + b).toDouble();
  //   return totalWinStreaks / winStreaks.length;
  // }

  double? calculateLargestProfit(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0.0;
    }

    return trades
        .map((trade) => trade.realizedPl)
        .reduce((a, b) => a! > b! ? a : b);
  }

  double calculateBestTradingMonth(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0.0;
    }

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

    return monthProfits[bestMonth]!;
  }

  double calculateWorstTradingMonth(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0.0;
    }

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

    return monthProfits[worstMonth]!;
  }

  double calculateAverageTradingMonth(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0.0;
    }

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

  double calculateAverageWinningTrade(List<TradeDto> trades) {
    if (trades.isEmpty) {
      return 0.0;
    }

    List<double?> winningTrades = trades
        .where((trade) => trade.realizedPl! > 0)
        .map((trade) => trade.realizedPl)
        .toList();

    if (winningTrades.isEmpty) return 0.0;

    double totalWin = winningTrades.reduce((a, b) => a! + b!)!;
    return totalWin / winningTrades.length;
  }
}
