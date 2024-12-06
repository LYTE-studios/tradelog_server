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
import '../../../platforms/meta/models/distance_trailing_stop_loss.dart' as _i2;
import '../../../platforms/meta/models/threshold_trailing_stop_loss.dart'
    as _i3;

abstract class TrailingStopLoss
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TrailingStopLoss._({
    required this.distance,
    required this.threshold,
  });

  factory TrailingStopLoss({
    required _i2.DistanceTrailingStopLoss distance,
    required _i3.ThresholdTrailingStopLoss threshold,
  }) = _TrailingStopLossImpl;

  factory TrailingStopLoss.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrailingStopLoss(
      distance: _i2.DistanceTrailingStopLoss.fromJson(
          (jsonSerialization['distance'] as Map<String, dynamic>)),
      threshold: _i3.ThresholdTrailingStopLoss.fromJson(
          (jsonSerialization['threshold'] as Map<String, dynamic>)),
    );
  }

  _i2.DistanceTrailingStopLoss distance;

  _i3.ThresholdTrailingStopLoss threshold;

  TrailingStopLoss copyWith({
    _i2.DistanceTrailingStopLoss? distance,
    _i3.ThresholdTrailingStopLoss? threshold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'distance': distance.toJson(),
      'threshold': threshold.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'distance': distance.toJsonForProtocol(),
      'threshold': threshold.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TrailingStopLossImpl extends TrailingStopLoss {
  _TrailingStopLossImpl({
    required _i2.DistanceTrailingStopLoss distance,
    required _i3.ThresholdTrailingStopLoss threshold,
  }) : super._(
          distance: distance,
          threshold: threshold,
        );

  @override
  TrailingStopLoss copyWith({
    _i2.DistanceTrailingStopLoss? distance,
    _i3.ThresholdTrailingStopLoss? threshold,
  }) {
    return TrailingStopLoss(
      distance: distance ?? this.distance.copyWith(),
      threshold: threshold ?? this.threshold.copyWith(),
    );
  }
}
