/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class LossLimitRule
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LossLimitRule._({
    required this.value,
    required this.warnLevel1,
    required this.warnLevel2,
  });

  factory LossLimitRule({
    required double value,
    required double warnLevel1,
    required double warnLevel2,
  }) = _LossLimitRuleImpl;

  factory LossLimitRule.fromJson(Map<String, dynamic> jsonSerialization) {
    return LossLimitRule(
      value: (jsonSerialization['value'] as num).toDouble(),
      warnLevel1: (jsonSerialization['warnLevel1'] as num).toDouble(),
      warnLevel2: (jsonSerialization['warnLevel2'] as num).toDouble(),
    );
  }

  double value;

  double warnLevel1;

  double warnLevel2;

  LossLimitRule copyWith({
    double? value,
    double? warnLevel1,
    double? warnLevel2,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'warnLevel1': warnLevel1,
      'warnLevel2': warnLevel2,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'value': value,
      'warnLevel1': warnLevel1,
      'warnLevel2': warnLevel2,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LossLimitRuleImpl extends LossLimitRule {
  _LossLimitRuleImpl({
    required double value,
    required double warnLevel1,
    required double warnLevel2,
  }) : super._(
          value: value,
          warnLevel1: warnLevel1,
          warnLevel2: warnLevel2,
        );

  @override
  LossLimitRule copyWith({
    double? value,
    double? warnLevel1,
    double? warnLevel2,
  }) {
    return LossLimitRule(
      value: value ?? this.value,
      warnLevel1: warnLevel1 ?? this.warnLevel1,
      warnLevel2: warnLevel2 ?? this.warnLevel2,
    );
  }
}
