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
    required this.netProfitLossThisMonth,
    this.netProfitLossTrend,
    required this.tradeWinRateThisMonth,
    this.tradeWinRateTrend,
    required this.realizedReturnThisMonth,
    this.realizedReturnTrend,
    required this.shortTradesAmount,
    required this.longTradesAmount,
  });

  factory OverviewStatistics({
    required double netProfitLossThisMonth,
    double? netProfitLossTrend,
    required double tradeWinRateThisMonth,
    double? tradeWinRateTrend,
    required double realizedReturnThisMonth,
    double? realizedReturnTrend,
    required double shortTradesAmount,
    required double longTradesAmount,
  }) = _OverviewStatisticsImpl;

  factory OverviewStatistics.fromJson(Map<String, dynamic> jsonSerialization) {
    return OverviewStatistics(
      netProfitLossThisMonth:
          (jsonSerialization['netProfitLossThisMonth'] as num).toDouble(),
      netProfitLossTrend:
          (jsonSerialization['netProfitLossTrend'] as num?)?.toDouble(),
      tradeWinRateThisMonth:
          (jsonSerialization['tradeWinRateThisMonth'] as num).toDouble(),
      tradeWinRateTrend:
          (jsonSerialization['tradeWinRateTrend'] as num?)?.toDouble(),
      realizedReturnThisMonth:
          (jsonSerialization['realizedReturnThisMonth'] as num).toDouble(),
      realizedReturnTrend:
          (jsonSerialization['realizedReturnTrend'] as num?)?.toDouble(),
      shortTradesAmount:
          (jsonSerialization['shortTradesAmount'] as num).toDouble(),
      longTradesAmount:
          (jsonSerialization['longTradesAmount'] as num).toDouble(),
    );
  }

  double netProfitLossThisMonth;

  double? netProfitLossTrend;

  double tradeWinRateThisMonth;

  double? tradeWinRateTrend;

  double realizedReturnThisMonth;

  double? realizedReturnTrend;

  double shortTradesAmount;

  double longTradesAmount;

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
      'netProfitLossThisMonth': netProfitLossThisMonth,
      if (netProfitLossTrend != null) 'netProfitLossTrend': netProfitLossTrend,
      'tradeWinRateThisMonth': tradeWinRateThisMonth,
      if (tradeWinRateTrend != null) 'tradeWinRateTrend': tradeWinRateTrend,
      'realizedReturnThisMonth': realizedReturnThisMonth,
      if (realizedReturnTrend != null)
        'realizedReturnTrend': realizedReturnTrend,
      'shortTradesAmount': shortTradesAmount,
      'longTradesAmount': longTradesAmount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'netProfitLossThisMonth': netProfitLossThisMonth,
      if (netProfitLossTrend != null) 'netProfitLossTrend': netProfitLossTrend,
      'tradeWinRateThisMonth': tradeWinRateThisMonth,
      if (tradeWinRateTrend != null) 'tradeWinRateTrend': tradeWinRateTrend,
      'realizedReturnThisMonth': realizedReturnThisMonth,
      if (realizedReturnTrend != null)
        'realizedReturnTrend': realizedReturnTrend,
      'shortTradesAmount': shortTradesAmount,
      'longTradesAmount': longTradesAmount,
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
    required double netProfitLossThisMonth,
    double? netProfitLossTrend,
    required double tradeWinRateThisMonth,
    double? tradeWinRateTrend,
    required double realizedReturnThisMonth,
    double? realizedReturnTrend,
    required double shortTradesAmount,
    required double longTradesAmount,
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
    double? netProfitLossThisMonth,
    Object? netProfitLossTrend = _Undefined,
    double? tradeWinRateThisMonth,
    Object? tradeWinRateTrend = _Undefined,
    double? realizedReturnThisMonth,
    Object? realizedReturnTrend = _Undefined,
    double? shortTradesAmount,
    double? longTradesAmount,
  }) {
    return OverviewStatistics(
      netProfitLossThisMonth:
          netProfitLossThisMonth ?? this.netProfitLossThisMonth,
      netProfitLossTrend: netProfitLossTrend is double?
          ? netProfitLossTrend
          : this.netProfitLossTrend,
      tradeWinRateThisMonth:
          tradeWinRateThisMonth ?? this.tradeWinRateThisMonth,
      tradeWinRateTrend: tradeWinRateTrend is double?
          ? tradeWinRateTrend
          : this.tradeWinRateTrend,
      realizedReturnThisMonth:
          realizedReturnThisMonth ?? this.realizedReturnThisMonth,
      realizedReturnTrend: realizedReturnTrend is double?
          ? realizedReturnTrend
          : this.realizedReturnTrend,
      shortTradesAmount: shortTradesAmount ?? this.shortTradesAmount,
      longTradesAmount: longTradesAmount ?? this.longTradesAmount,
    );
  }
}
