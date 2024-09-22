/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class TickCost
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TickCost._({
    this.leftRangeLimit,
    this.tickCost,
  });

  factory TickCost({
    double? leftRangeLimit,
    double? tickCost,
  }) = _TickCostImpl;

  factory TickCost.fromJson(Map<String, dynamic> jsonSerialization) {
    return TickCost(
      leftRangeLimit: (jsonSerialization['leftRangeLimit'] as num?)?.toDouble(),
      tickCost: (jsonSerialization['tickCost'] as num?)?.toDouble(),
    );
  }

  double? leftRangeLimit;

  double? tickCost;

  TickCost copyWith({
    double? leftRangeLimit,
    double? tickCost,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (leftRangeLimit != null) 'leftRangeLimit': leftRangeLimit,
      if (tickCost != null) 'tickCost': tickCost,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (leftRangeLimit != null) 'leftRangeLimit': leftRangeLimit,
      if (tickCost != null) 'tickCost': tickCost,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TickCostImpl extends TickCost {
  _TickCostImpl({
    double? leftRangeLimit,
    double? tickCost,
  }) : super._(
          leftRangeLimit: leftRangeLimit,
          tickCost: tickCost,
        );

  @override
  TickCost copyWith({
    Object? leftRangeLimit = _Undefined,
    Object? tickCost = _Undefined,
  }) {
    return TickCost(
      leftRangeLimit:
          leftRangeLimit is double? ? leftRangeLimit : this.leftRangeLimit,
      tickCost: tickCost is double? ? tickCost : this.tickCost,
    );
  }
}
