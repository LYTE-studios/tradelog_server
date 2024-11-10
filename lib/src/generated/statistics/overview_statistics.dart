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

abstract class OverviewStatistics
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  OverviewStatistics._({
    this.netProfitLossThisMonth,
    this.netProfitLossTrend,
    this.tradeWinRateThisMonth,
    this.tradeWinRateTrend,
    this.realizedReturnThisMonth,
    this.realizedReturnTrend,
    this.shortTradesAmount,
    this.longTradesAmount,
  });

  factory OverviewStatistics({
    double? netProfitLossThisMonth,
    double? netProfitLossTrend,
    double? tradeWinRateThisMonth,
    double? tradeWinRateTrend,
    double? realizedReturnThisMonth,
    double? realizedReturnTrend,
    double? shortTradesAmount,
    double? longTradesAmount,
  }) = _OverviewStatisticsImpl;

  factory OverviewStatistics.fromJson(Map<String, dynamic> jsonSerialization) {
    return OverviewStatistics(
      netProfitLossThisMonth:
          (jsonSerialization['netProfitLossThisMonth'] as num?)?.toDouble(),
      netProfitLossTrend:
          (jsonSerialization['netProfitLossTrend'] as num?)?.toDouble(),
      tradeWinRateThisMonth:
          (jsonSerialization['tradeWinRateThisMonth'] as num?)?.toDouble(),
      tradeWinRateTrend:
          (jsonSerialization['tradeWinRateTrend'] as num?)?.toDouble(),
      realizedReturnThisMonth:
          (jsonSerialization['realizedReturnThisMonth'] as num?)?.toDouble(),
      realizedReturnTrend:
          (jsonSerialization['realizedReturnTrend'] as num?)?.toDouble(),
      shortTradesAmount:
          (jsonSerialization['shortTradesAmount'] as num?)?.toDouble(),
      longTradesAmount:
          (jsonSerialization['longTradesAmount'] as num?)?.toDouble(),
    );
  }

  double? netProfitLossThisMonth;

  double? netProfitLossTrend;

  double? tradeWinRateThisMonth;

  double? tradeWinRateTrend;

  double? realizedReturnThisMonth;

  double? realizedReturnTrend;

  double? shortTradesAmount;

  double? longTradesAmount;

  OverviewStatistics copyWith({
    double? netProfitLossThisMonth,
    double? netProfitLossTrend,
    double? tradeWinRateThisMonth,
    double? tradeWinRateTrend,
    double? realizedReturnThisMonth,
    double? realizedReturnTrend,
    double? shortTradesAmount,
    double? longTradesAmount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (netProfitLossThisMonth != null)
        'netProfitLossThisMonth': netProfitLossThisMonth,
      if (netProfitLossTrend != null) 'netProfitLossTrend': netProfitLossTrend,
      if (tradeWinRateThisMonth != null)
        'tradeWinRateThisMonth': tradeWinRateThisMonth,
      if (tradeWinRateTrend != null) 'tradeWinRateTrend': tradeWinRateTrend,
      if (realizedReturnThisMonth != null)
        'realizedReturnThisMonth': realizedReturnThisMonth,
      if (realizedReturnTrend != null)
        'realizedReturnTrend': realizedReturnTrend,
      if (shortTradesAmount != null) 'shortTradesAmount': shortTradesAmount,
      if (longTradesAmount != null) 'longTradesAmount': longTradesAmount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (netProfitLossThisMonth != null)
        'netProfitLossThisMonth': netProfitLossThisMonth,
      if (netProfitLossTrend != null) 'netProfitLossTrend': netProfitLossTrend,
      if (tradeWinRateThisMonth != null)
        'tradeWinRateThisMonth': tradeWinRateThisMonth,
      if (tradeWinRateTrend != null) 'tradeWinRateTrend': tradeWinRateTrend,
      if (realizedReturnThisMonth != null)
        'realizedReturnThisMonth': realizedReturnThisMonth,
      if (realizedReturnTrend != null)
        'realizedReturnTrend': realizedReturnTrend,
      if (shortTradesAmount != null) 'shortTradesAmount': shortTradesAmount,
      if (longTradesAmount != null) 'longTradesAmount': longTradesAmount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OverviewStatisticsImpl extends OverviewStatistics {
  _OverviewStatisticsImpl({
    double? netProfitLossThisMonth,
    double? netProfitLossTrend,
    double? tradeWinRateThisMonth,
    double? tradeWinRateTrend,
    double? realizedReturnThisMonth,
    double? realizedReturnTrend,
    double? shortTradesAmount,
    double? longTradesAmount,
  }) : super._(
          netProfitLossThisMonth: netProfitLossThisMonth,
          netProfitLossTrend: netProfitLossTrend,
          tradeWinRateThisMonth: tradeWinRateThisMonth,
          tradeWinRateTrend: tradeWinRateTrend,
          realizedReturnThisMonth: realizedReturnThisMonth,
          realizedReturnTrend: realizedReturnTrend,
          shortTradesAmount: shortTradesAmount,
          longTradesAmount: longTradesAmount,
        );

  @override
  OverviewStatistics copyWith({
    Object? netProfitLossThisMonth = _Undefined,
    Object? netProfitLossTrend = _Undefined,
    Object? tradeWinRateThisMonth = _Undefined,
    Object? tradeWinRateTrend = _Undefined,
    Object? realizedReturnThisMonth = _Undefined,
    Object? realizedReturnTrend = _Undefined,
    Object? shortTradesAmount = _Undefined,
    Object? longTradesAmount = _Undefined,
  }) {
    return OverviewStatistics(
      netProfitLossThisMonth: netProfitLossThisMonth is double?
          ? netProfitLossThisMonth
          : this.netProfitLossThisMonth,
      netProfitLossTrend: netProfitLossTrend is double?
          ? netProfitLossTrend
          : this.netProfitLossTrend,
      tradeWinRateThisMonth: tradeWinRateThisMonth is double?
          ? tradeWinRateThisMonth
          : this.tradeWinRateThisMonth,
      tradeWinRateTrend: tradeWinRateTrend is double?
          ? tradeWinRateTrend
          : this.tradeWinRateTrend,
      realizedReturnThisMonth: realizedReturnThisMonth is double?
          ? realizedReturnThisMonth
          : this.realizedReturnThisMonth,
      realizedReturnTrend: realizedReturnTrend is double?
          ? realizedReturnTrend
          : this.realizedReturnTrend,
      shortTradesAmount: shortTradesAmount is double?
          ? shortTradesAmount
          : this.shortTradesAmount,
      longTradesAmount: longTradesAmount is double?
          ? longTradesAmount
          : this.longTradesAmount,
    );
  }
}
