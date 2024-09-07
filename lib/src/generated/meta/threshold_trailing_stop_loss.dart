/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class ThresholdTrailingStopLoss
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ThresholdTrailingStopLoss._({
    required this.thresholds,
    this.units,
    this.stopPriceBase,
  });

  factory ThresholdTrailingStopLoss({
    required List<_i2.StopLossThreshold> thresholds,
    String? units,
    String? stopPriceBase,
  }) = _ThresholdTrailingStopLossImpl;

  factory ThresholdTrailingStopLoss.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ThresholdTrailingStopLoss(
      thresholds: (jsonSerialization['thresholds'] as List)
          .map((e) =>
              _i2.StopLossThreshold.fromJson((e as Map<String, dynamic>)))
          .toList(),
      units: jsonSerialization['units'] as String?,
      stopPriceBase: jsonSerialization['stopPriceBase'] as String?,
    );
  }

  List<_i2.StopLossThreshold> thresholds;

  String? units;

  String? stopPriceBase;

  ThresholdTrailingStopLoss copyWith({
    List<_i2.StopLossThreshold>? thresholds,
    String? units,
    String? stopPriceBase,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'thresholds': thresholds.toJson(valueToJson: (v) => v.toJson()),
      if (units != null) 'units': units,
      if (stopPriceBase != null) 'stopPriceBase': stopPriceBase,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'thresholds':
          thresholds.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (units != null) 'units': units,
      if (stopPriceBase != null) 'stopPriceBase': stopPriceBase,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ThresholdTrailingStopLossImpl extends ThresholdTrailingStopLoss {
  _ThresholdTrailingStopLossImpl({
    required List<_i2.StopLossThreshold> thresholds,
    String? units,
    String? stopPriceBase,
  }) : super._(
          thresholds: thresholds,
          units: units,
          stopPriceBase: stopPriceBase,
        );

  @override
  ThresholdTrailingStopLoss copyWith({
    List<_i2.StopLossThreshold>? thresholds,
    Object? units = _Undefined,
    Object? stopPriceBase = _Undefined,
  }) {
    return ThresholdTrailingStopLoss(
      thresholds: thresholds ?? this.thresholds.clone(),
      units: units is String? ? units : this.units,
      stopPriceBase:
          stopPriceBase is String? ? stopPriceBase : this.stopPriceBase,
    );
  }
}
