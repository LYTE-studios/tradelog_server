/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class StatisticsDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StatisticsDto._({
    this.totalPL,
    this.averageWinningTrade,
    this.totalNumberOfTrades,
    this.numberOfBreakEvenTrades,
    this.maxConsecutiveLosses,
    this.totalFees,
    this.largestProfit,
    this.largestLoss,
    this.averageHoldingTime,
    this.bestTradingMonth,
    this.worstTradingMonth,
    this.averageTradingMonth,
    this.maxWinStreak,
    this.averageWinStreak,
  });

  factory StatisticsDto({
    double? totalPL,
    double? averageWinningTrade,
    int? totalNumberOfTrades,
    int? numberOfBreakEvenTrades,
    int? maxConsecutiveLosses,
    double? totalFees,
    double? largestProfit,
    double? largestLoss,
    double? averageHoldingTime,
    double? bestTradingMonth,
    double? worstTradingMonth,
    double? averageTradingMonth,
    int? maxWinStreak,
    double? averageWinStreak,
  }) = _StatisticsDtoImpl;

  factory StatisticsDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return StatisticsDto(
      totalPL: (jsonSerialization['totalPL'] as num?)?.toDouble(),
      averageWinningTrade:
          (jsonSerialization['averageWinningTrade'] as num?)?.toDouble(),
      totalNumberOfTrades: jsonSerialization['totalNumberOfTrades'] as int?,
      numberOfBreakEvenTrades:
          jsonSerialization['numberOfBreakEvenTrades'] as int?,
      maxConsecutiveLosses: jsonSerialization['maxConsecutiveLosses'] as int?,
      totalFees: (jsonSerialization['totalFees'] as num?)?.toDouble(),
      largestProfit: (jsonSerialization['largestProfit'] as num?)?.toDouble(),
      largestLoss: (jsonSerialization['largestLoss'] as num?)?.toDouble(),
      averageHoldingTime:
          (jsonSerialization['averageHoldingTime'] as num?)?.toDouble(),
      bestTradingMonth:
          (jsonSerialization['bestTradingMonth'] as num?)?.toDouble(),
      worstTradingMonth:
          (jsonSerialization['worstTradingMonth'] as num?)?.toDouble(),
      averageTradingMonth:
          (jsonSerialization['averageTradingMonth'] as num?)?.toDouble(),
      maxWinStreak: jsonSerialization['maxWinStreak'] as int?,
      averageWinStreak:
          (jsonSerialization['averageWinStreak'] as num?)?.toDouble(),
    );
  }

  double? totalPL;

  double? averageWinningTrade;

  int? totalNumberOfTrades;

  int? numberOfBreakEvenTrades;

  int? maxConsecutiveLosses;

  double? totalFees;

  double? largestProfit;

  double? largestLoss;

  double? averageHoldingTime;

  double? bestTradingMonth;

  double? worstTradingMonth;

  double? averageTradingMonth;

  int? maxWinStreak;

  double? averageWinStreak;

  StatisticsDto copyWith({
    double? totalPL,
    double? averageWinningTrade,
    int? totalNumberOfTrades,
    int? numberOfBreakEvenTrades,
    int? maxConsecutiveLosses,
    double? totalFees,
    double? largestProfit,
    double? largestLoss,
    double? averageHoldingTime,
    double? bestTradingMonth,
    double? worstTradingMonth,
    double? averageTradingMonth,
    int? maxWinStreak,
    double? averageWinStreak,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (totalPL != null) 'totalPL': totalPL,
      if (averageWinningTrade != null)
        'averageWinningTrade': averageWinningTrade,
      if (totalNumberOfTrades != null)
        'totalNumberOfTrades': totalNumberOfTrades,
      if (numberOfBreakEvenTrades != null)
        'numberOfBreakEvenTrades': numberOfBreakEvenTrades,
      if (maxConsecutiveLosses != null)
        'maxConsecutiveLosses': maxConsecutiveLosses,
      if (totalFees != null) 'totalFees': totalFees,
      if (largestProfit != null) 'largestProfit': largestProfit,
      if (largestLoss != null) 'largestLoss': largestLoss,
      if (averageHoldingTime != null) 'averageHoldingTime': averageHoldingTime,
      if (bestTradingMonth != null) 'bestTradingMonth': bestTradingMonth,
      if (worstTradingMonth != null) 'worstTradingMonth': worstTradingMonth,
      if (averageTradingMonth != null)
        'averageTradingMonth': averageTradingMonth,
      if (maxWinStreak != null) 'maxWinStreak': maxWinStreak,
      if (averageWinStreak != null) 'averageWinStreak': averageWinStreak,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (totalPL != null) 'totalPL': totalPL,
      if (averageWinningTrade != null)
        'averageWinningTrade': averageWinningTrade,
      if (totalNumberOfTrades != null)
        'totalNumberOfTrades': totalNumberOfTrades,
      if (numberOfBreakEvenTrades != null)
        'numberOfBreakEvenTrades': numberOfBreakEvenTrades,
      if (maxConsecutiveLosses != null)
        'maxConsecutiveLosses': maxConsecutiveLosses,
      if (totalFees != null) 'totalFees': totalFees,
      if (largestProfit != null) 'largestProfit': largestProfit,
      if (largestLoss != null) 'largestLoss': largestLoss,
      if (averageHoldingTime != null) 'averageHoldingTime': averageHoldingTime,
      if (bestTradingMonth != null) 'bestTradingMonth': bestTradingMonth,
      if (worstTradingMonth != null) 'worstTradingMonth': worstTradingMonth,
      if (averageTradingMonth != null)
        'averageTradingMonth': averageTradingMonth,
      if (maxWinStreak != null) 'maxWinStreak': maxWinStreak,
      if (averageWinStreak != null) 'averageWinStreak': averageWinStreak,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StatisticsDtoImpl extends StatisticsDto {
  _StatisticsDtoImpl({
    double? totalPL,
    double? averageWinningTrade,
    int? totalNumberOfTrades,
    int? numberOfBreakEvenTrades,
    int? maxConsecutiveLosses,
    double? totalFees,
    double? largestProfit,
    double? largestLoss,
    double? averageHoldingTime,
    double? bestTradingMonth,
    double? worstTradingMonth,
    double? averageTradingMonth,
    int? maxWinStreak,
    double? averageWinStreak,
  }) : super._(
          totalPL: totalPL,
          averageWinningTrade: averageWinningTrade,
          totalNumberOfTrades: totalNumberOfTrades,
          numberOfBreakEvenTrades: numberOfBreakEvenTrades,
          maxConsecutiveLosses: maxConsecutiveLosses,
          totalFees: totalFees,
          largestProfit: largestProfit,
          largestLoss: largestLoss,
          averageHoldingTime: averageHoldingTime,
          bestTradingMonth: bestTradingMonth,
          worstTradingMonth: worstTradingMonth,
          averageTradingMonth: averageTradingMonth,
          maxWinStreak: maxWinStreak,
          averageWinStreak: averageWinStreak,
        );

  @override
  StatisticsDto copyWith({
    Object? totalPL = _Undefined,
    Object? averageWinningTrade = _Undefined,
    Object? totalNumberOfTrades = _Undefined,
    Object? numberOfBreakEvenTrades = _Undefined,
    Object? maxConsecutiveLosses = _Undefined,
    Object? totalFees = _Undefined,
    Object? largestProfit = _Undefined,
    Object? largestLoss = _Undefined,
    Object? averageHoldingTime = _Undefined,
    Object? bestTradingMonth = _Undefined,
    Object? worstTradingMonth = _Undefined,
    Object? averageTradingMonth = _Undefined,
    Object? maxWinStreak = _Undefined,
    Object? averageWinStreak = _Undefined,
  }) {
    return StatisticsDto(
      totalPL: totalPL is double? ? totalPL : this.totalPL,
      averageWinningTrade: averageWinningTrade is double?
          ? averageWinningTrade
          : this.averageWinningTrade,
      totalNumberOfTrades: totalNumberOfTrades is int?
          ? totalNumberOfTrades
          : this.totalNumberOfTrades,
      numberOfBreakEvenTrades: numberOfBreakEvenTrades is int?
          ? numberOfBreakEvenTrades
          : this.numberOfBreakEvenTrades,
      maxConsecutiveLosses: maxConsecutiveLosses is int?
          ? maxConsecutiveLosses
          : this.maxConsecutiveLosses,
      totalFees: totalFees is double? ? totalFees : this.totalFees,
      largestProfit:
          largestProfit is double? ? largestProfit : this.largestProfit,
      largestLoss: largestLoss is double? ? largestLoss : this.largestLoss,
      averageHoldingTime: averageHoldingTime is double?
          ? averageHoldingTime
          : this.averageHoldingTime,
      bestTradingMonth: bestTradingMonth is double?
          ? bestTradingMonth
          : this.bestTradingMonth,
      worstTradingMonth: worstTradingMonth is double?
          ? worstTradingMonth
          : this.worstTradingMonth,
      averageTradingMonth: averageTradingMonth is double?
          ? averageTradingMonth
          : this.averageTradingMonth,
      maxWinStreak: maxWinStreak is int? ? maxWinStreak : this.maxWinStreak,
      averageWinStreak: averageWinStreak is double?
          ? averageWinStreak
          : this.averageWinStreak,
    );
  }
}
