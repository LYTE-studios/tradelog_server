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

abstract class OverviewStatisticsDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  OverviewStatisticsDto._({
    this.netProfitLossThisMonth,
    this.netProfitLossTrend,
    this.tradeWinRateThisMonth,
    this.tradeWinRateTrend,
    this.realizedReturnThisMonth,
    this.realizedReturnTrend,
    this.shortTradesAmount,
    this.longTradesAmount,
    this.averageHoldingTime,
    this.profitFactor,
    this.equityChartData,
  });

  factory OverviewStatisticsDto({
    double? netProfitLossThisMonth,
    double? netProfitLossTrend,
    double? tradeWinRateThisMonth,
    double? tradeWinRateTrend,
    double? realizedReturnThisMonth,
    double? realizedReturnTrend,
    int? shortTradesAmount,
    int? longTradesAmount,
    double? averageHoldingTime,
    double? profitFactor,
    Map<DateTime, double>? equityChartData,
  }) = _OverviewStatisticsDtoImpl;

  factory OverviewStatisticsDto.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return OverviewStatisticsDto(
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
      shortTradesAmount: jsonSerialization['shortTradesAmount'] as int?,
      longTradesAmount: jsonSerialization['longTradesAmount'] as int?,
      averageHoldingTime:
          (jsonSerialization['averageHoldingTime'] as num?)?.toDouble(),
      profitFactor: (jsonSerialization['profitFactor'] as num?)?.toDouble(),
      equityChartData: (jsonSerialization['equityChartData'] as List?)
          ?.fold<Map<DateTime, double>>(
              {},
              (t, e) => {
                    ...t,
                    _i1.DateTimeJsonExtension.fromJson(e['k']):
                        (e['v'] as num).toDouble()
                  }),
    );
  }

  double? netProfitLossThisMonth;

  double? netProfitLossTrend;

  double? tradeWinRateThisMonth;

  double? tradeWinRateTrend;

  double? realizedReturnThisMonth;

  double? realizedReturnTrend;

  int? shortTradesAmount;

  int? longTradesAmount;

  double? averageHoldingTime;

  double? profitFactor;

  Map<DateTime, double>? equityChartData;

  OverviewStatisticsDto copyWith({
    double? netProfitLossThisMonth,
    double? netProfitLossTrend,
    double? tradeWinRateThisMonth,
    double? tradeWinRateTrend,
    double? realizedReturnThisMonth,
    double? realizedReturnTrend,
    int? shortTradesAmount,
    int? longTradesAmount,
    double? averageHoldingTime,
    double? profitFactor,
    Map<DateTime, double>? equityChartData,
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
      if (averageHoldingTime != null) 'averageHoldingTime': averageHoldingTime,
      if (profitFactor != null) 'profitFactor': profitFactor,
      if (equityChartData != null)
        'equityChartData':
            equityChartData?.toJson(keyToJson: (k) => k.toJson()),
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
      if (averageHoldingTime != null) 'averageHoldingTime': averageHoldingTime,
      if (profitFactor != null) 'profitFactor': profitFactor,
      if (equityChartData != null)
        'equityChartData':
            equityChartData?.toJson(keyToJson: (k) => k.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OverviewStatisticsDtoImpl extends OverviewStatisticsDto {
  _OverviewStatisticsDtoImpl({
    double? netProfitLossThisMonth,
    double? netProfitLossTrend,
    double? tradeWinRateThisMonth,
    double? tradeWinRateTrend,
    double? realizedReturnThisMonth,
    double? realizedReturnTrend,
    int? shortTradesAmount,
    int? longTradesAmount,
    double? averageHoldingTime,
    double? profitFactor,
    Map<DateTime, double>? equityChartData,
  }) : super._(
          netProfitLossThisMonth: netProfitLossThisMonth,
          netProfitLossTrend: netProfitLossTrend,
          tradeWinRateThisMonth: tradeWinRateThisMonth,
          tradeWinRateTrend: tradeWinRateTrend,
          realizedReturnThisMonth: realizedReturnThisMonth,
          realizedReturnTrend: realizedReturnTrend,
          shortTradesAmount: shortTradesAmount,
          longTradesAmount: longTradesAmount,
          averageHoldingTime: averageHoldingTime,
          profitFactor: profitFactor,
          equityChartData: equityChartData,
        );

  @override
  OverviewStatisticsDto copyWith({
    Object? netProfitLossThisMonth = _Undefined,
    Object? netProfitLossTrend = _Undefined,
    Object? tradeWinRateThisMonth = _Undefined,
    Object? tradeWinRateTrend = _Undefined,
    Object? realizedReturnThisMonth = _Undefined,
    Object? realizedReturnTrend = _Undefined,
    Object? shortTradesAmount = _Undefined,
    Object? longTradesAmount = _Undefined,
    Object? averageHoldingTime = _Undefined,
    Object? profitFactor = _Undefined,
    Object? equityChartData = _Undefined,
  }) {
    return OverviewStatisticsDto(
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
      shortTradesAmount: shortTradesAmount is int?
          ? shortTradesAmount
          : this.shortTradesAmount,
      longTradesAmount:
          longTradesAmount is int? ? longTradesAmount : this.longTradesAmount,
      averageHoldingTime: averageHoldingTime is double?
          ? averageHoldingTime
          : this.averageHoldingTime,
      profitFactor: profitFactor is double? ? profitFactor : this.profitFactor,
      equityChartData: equityChartData is Map<DateTime, double>?
          ? equityChartData
          : this.equityChartData?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}
