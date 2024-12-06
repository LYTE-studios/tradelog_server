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
import '../../../platforms/tradelocker/models/loss_limit_rule.dart' as _i2;

abstract class RiskRules
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RiskRules._({
    required this.balanceRelativeDrawdown,
    required this.dailyLossLimit,
    required this.dailyProfitTarget,
    required this.maxDrawdownLevel,
    required this.maxOrderAmount,
    required this.maxOrderCapital,
    required this.maxOrdersCount,
    required this.maxPendingOrdersNumber,
    required this.maxPositionsNumber,
    required this.maxTrailingDrawdown,
    required this.positionLossLimit,
    required this.totalMaxPositionQty,
    required this.unrealizedLossLimit,
    required this.weeklyLossLimit,
  });

  factory RiskRules({
    required double balanceRelativeDrawdown,
    required _i2.LossLimitRule dailyLossLimit,
    required double dailyProfitTarget,
    required double maxDrawdownLevel,
    required double maxOrderAmount,
    required double maxOrderCapital,
    required double maxOrdersCount,
    required double maxPendingOrdersNumber,
    required double maxPositionsNumber,
    required double maxTrailingDrawdown,
    required double positionLossLimit,
    required double totalMaxPositionQty,
    required _i2.LossLimitRule unrealizedLossLimit,
    required _i2.LossLimitRule weeklyLossLimit,
  }) = _RiskRulesImpl;

  factory RiskRules.fromJson(Map<String, dynamic> jsonSerialization) {
    return RiskRules(
      balanceRelativeDrawdown:
          (jsonSerialization['balanceRelativeDrawdown'] as num).toDouble(),
      dailyLossLimit: _i2.LossLimitRule.fromJson(
          (jsonSerialization['dailyLossLimit'] as Map<String, dynamic>)),
      dailyProfitTarget:
          (jsonSerialization['dailyProfitTarget'] as num).toDouble(),
      maxDrawdownLevel:
          (jsonSerialization['maxDrawdownLevel'] as num).toDouble(),
      maxOrderAmount: (jsonSerialization['maxOrderAmount'] as num).toDouble(),
      maxOrderCapital: (jsonSerialization['maxOrderCapital'] as num).toDouble(),
      maxOrdersCount: (jsonSerialization['maxOrdersCount'] as num).toDouble(),
      maxPendingOrdersNumber:
          (jsonSerialization['maxPendingOrdersNumber'] as num).toDouble(),
      maxPositionsNumber:
          (jsonSerialization['maxPositionsNumber'] as num).toDouble(),
      maxTrailingDrawdown:
          (jsonSerialization['maxTrailingDrawdown'] as num).toDouble(),
      positionLossLimit:
          (jsonSerialization['positionLossLimit'] as num).toDouble(),
      totalMaxPositionQty:
          (jsonSerialization['totalMaxPositionQty'] as num).toDouble(),
      unrealizedLossLimit: _i2.LossLimitRule.fromJson(
          (jsonSerialization['unrealizedLossLimit'] as Map<String, dynamic>)),
      weeklyLossLimit: _i2.LossLimitRule.fromJson(
          (jsonSerialization['weeklyLossLimit'] as Map<String, dynamic>)),
    );
  }

  double balanceRelativeDrawdown;

  _i2.LossLimitRule dailyLossLimit;

  double dailyProfitTarget;

  double maxDrawdownLevel;

  double maxOrderAmount;

  double maxOrderCapital;

  double maxOrdersCount;

  double maxPendingOrdersNumber;

  double maxPositionsNumber;

  double maxTrailingDrawdown;

  double positionLossLimit;

  double totalMaxPositionQty;

  _i2.LossLimitRule unrealizedLossLimit;

  _i2.LossLimitRule weeklyLossLimit;

  RiskRules copyWith({
    double? balanceRelativeDrawdown,
    _i2.LossLimitRule? dailyLossLimit,
    double? dailyProfitTarget,
    double? maxDrawdownLevel,
    double? maxOrderAmount,
    double? maxOrderCapital,
    double? maxOrdersCount,
    double? maxPendingOrdersNumber,
    double? maxPositionsNumber,
    double? maxTrailingDrawdown,
    double? positionLossLimit,
    double? totalMaxPositionQty,
    _i2.LossLimitRule? unrealizedLossLimit,
    _i2.LossLimitRule? weeklyLossLimit,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'balanceRelativeDrawdown': balanceRelativeDrawdown,
      'dailyLossLimit': dailyLossLimit.toJson(),
      'dailyProfitTarget': dailyProfitTarget,
      'maxDrawdownLevel': maxDrawdownLevel,
      'maxOrderAmount': maxOrderAmount,
      'maxOrderCapital': maxOrderCapital,
      'maxOrdersCount': maxOrdersCount,
      'maxPendingOrdersNumber': maxPendingOrdersNumber,
      'maxPositionsNumber': maxPositionsNumber,
      'maxTrailingDrawdown': maxTrailingDrawdown,
      'positionLossLimit': positionLossLimit,
      'totalMaxPositionQty': totalMaxPositionQty,
      'unrealizedLossLimit': unrealizedLossLimit.toJson(),
      'weeklyLossLimit': weeklyLossLimit.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'balanceRelativeDrawdown': balanceRelativeDrawdown,
      'dailyLossLimit': dailyLossLimit.toJsonForProtocol(),
      'dailyProfitTarget': dailyProfitTarget,
      'maxDrawdownLevel': maxDrawdownLevel,
      'maxOrderAmount': maxOrderAmount,
      'maxOrderCapital': maxOrderCapital,
      'maxOrdersCount': maxOrdersCount,
      'maxPendingOrdersNumber': maxPendingOrdersNumber,
      'maxPositionsNumber': maxPositionsNumber,
      'maxTrailingDrawdown': maxTrailingDrawdown,
      'positionLossLimit': positionLossLimit,
      'totalMaxPositionQty': totalMaxPositionQty,
      'unrealizedLossLimit': unrealizedLossLimit.toJsonForProtocol(),
      'weeklyLossLimit': weeklyLossLimit.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RiskRulesImpl extends RiskRules {
  _RiskRulesImpl({
    required double balanceRelativeDrawdown,
    required _i2.LossLimitRule dailyLossLimit,
    required double dailyProfitTarget,
    required double maxDrawdownLevel,
    required double maxOrderAmount,
    required double maxOrderCapital,
    required double maxOrdersCount,
    required double maxPendingOrdersNumber,
    required double maxPositionsNumber,
    required double maxTrailingDrawdown,
    required double positionLossLimit,
    required double totalMaxPositionQty,
    required _i2.LossLimitRule unrealizedLossLimit,
    required _i2.LossLimitRule weeklyLossLimit,
  }) : super._(
          balanceRelativeDrawdown: balanceRelativeDrawdown,
          dailyLossLimit: dailyLossLimit,
          dailyProfitTarget: dailyProfitTarget,
          maxDrawdownLevel: maxDrawdownLevel,
          maxOrderAmount: maxOrderAmount,
          maxOrderCapital: maxOrderCapital,
          maxOrdersCount: maxOrdersCount,
          maxPendingOrdersNumber: maxPendingOrdersNumber,
          maxPositionsNumber: maxPositionsNumber,
          maxTrailingDrawdown: maxTrailingDrawdown,
          positionLossLimit: positionLossLimit,
          totalMaxPositionQty: totalMaxPositionQty,
          unrealizedLossLimit: unrealizedLossLimit,
          weeklyLossLimit: weeklyLossLimit,
        );

  @override
  RiskRules copyWith({
    double? balanceRelativeDrawdown,
    _i2.LossLimitRule? dailyLossLimit,
    double? dailyProfitTarget,
    double? maxDrawdownLevel,
    double? maxOrderAmount,
    double? maxOrderCapital,
    double? maxOrdersCount,
    double? maxPendingOrdersNumber,
    double? maxPositionsNumber,
    double? maxTrailingDrawdown,
    double? positionLossLimit,
    double? totalMaxPositionQty,
    _i2.LossLimitRule? unrealizedLossLimit,
    _i2.LossLimitRule? weeklyLossLimit,
  }) {
    return RiskRules(
      balanceRelativeDrawdown:
          balanceRelativeDrawdown ?? this.balanceRelativeDrawdown,
      dailyLossLimit: dailyLossLimit ?? this.dailyLossLimit.copyWith(),
      dailyProfitTarget: dailyProfitTarget ?? this.dailyProfitTarget,
      maxDrawdownLevel: maxDrawdownLevel ?? this.maxDrawdownLevel,
      maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
      maxOrderCapital: maxOrderCapital ?? this.maxOrderCapital,
      maxOrdersCount: maxOrdersCount ?? this.maxOrdersCount,
      maxPendingOrdersNumber:
          maxPendingOrdersNumber ?? this.maxPendingOrdersNumber,
      maxPositionsNumber: maxPositionsNumber ?? this.maxPositionsNumber,
      maxTrailingDrawdown: maxTrailingDrawdown ?? this.maxTrailingDrawdown,
      positionLossLimit: positionLossLimit ?? this.positionLossLimit,
      totalMaxPositionQty: totalMaxPositionQty ?? this.totalMaxPositionQty,
      unrealizedLossLimit:
          unrealizedLossLimit ?? this.unrealizedLossLimit.copyWith(),
      weeklyLossLimit: weeklyLossLimit ?? this.weeklyLossLimit.copyWith(),
    );
  }
}
