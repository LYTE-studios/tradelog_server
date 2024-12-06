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

abstract class DistanceTrailingStopLoss
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DistanceTrailingStopLoss._({
    required this.distance,
    this.units,
  });

  factory DistanceTrailingStopLoss({
    required double distance,
    String? units,
  }) = _DistanceTrailingStopLossImpl;

  factory DistanceTrailingStopLoss.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DistanceTrailingStopLoss(
      distance: (jsonSerialization['distance'] as num).toDouble(),
      units: jsonSerialization['units'] as String?,
    );
  }

  double distance;

  String? units;

  DistanceTrailingStopLoss copyWith({
    double? distance,
    String? units,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'distance': distance,
      if (units != null) 'units': units,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'distance': distance,
      if (units != null) 'units': units,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DistanceTrailingStopLossImpl extends DistanceTrailingStopLoss {
  _DistanceTrailingStopLossImpl({
    required double distance,
    String? units,
  }) : super._(
          distance: distance,
          units: units,
        );

  @override
  DistanceTrailingStopLoss copyWith({
    double? distance,
    Object? units = _Undefined,
  }) {
    return DistanceTrailingStopLoss(
      distance: distance ?? this.distance,
      units: units is String? ? units : this.units,
    );
  }
}
