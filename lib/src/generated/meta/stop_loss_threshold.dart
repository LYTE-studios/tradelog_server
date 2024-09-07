/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class StopLossThreshold
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StopLossThreshold._({
    required this.threshold,
    required this.stopLoss,
  });

  factory StopLossThreshold({
    required double threshold,
    required double stopLoss,
  }) = _StopLossThresholdImpl;

  factory StopLossThreshold.fromJson(Map<String, dynamic> jsonSerialization) {
    return StopLossThreshold(
      threshold: (jsonSerialization['threshold'] as num).toDouble(),
      stopLoss: (jsonSerialization['stopLoss'] as num).toDouble(),
    );
  }

  double threshold;

  double stopLoss;

  StopLossThreshold copyWith({
    double? threshold,
    double? stopLoss,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'threshold': threshold,
      'stopLoss': stopLoss,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'threshold': threshold,
      'stopLoss': stopLoss,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StopLossThresholdImpl extends StopLossThreshold {
  _StopLossThresholdImpl({
    required double threshold,
    required double stopLoss,
  }) : super._(
          threshold: threshold,
          stopLoss: stopLoss,
        );

  @override
  StopLossThreshold copyWith({
    double? threshold,
    double? stopLoss,
  }) {
    return StopLossThreshold(
      threshold: threshold ?? this.threshold,
      stopLoss: stopLoss ?? this.stopLoss,
    );
  }
}
