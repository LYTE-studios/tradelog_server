/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class TickSize
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TickSize._({
    this.leftRangeLimit,
    this.tickSize,
  });

  factory TickSize({
    double? leftRangeLimit,
    double? tickSize,
  }) = _TickSizeImpl;

  factory TickSize.fromJson(Map<String, dynamic> jsonSerialization) {
    return TickSize(
      leftRangeLimit: (jsonSerialization['leftRangeLimit'] as num?)?.toDouble(),
      tickSize: (jsonSerialization['tickSize'] as num?)?.toDouble(),
    );
  }

  double? leftRangeLimit;

  double? tickSize;

  TickSize copyWith({
    double? leftRangeLimit,
    double? tickSize,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (leftRangeLimit != null) 'leftRangeLimit': leftRangeLimit,
      if (tickSize != null) 'tickSize': tickSize,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (leftRangeLimit != null) 'leftRangeLimit': leftRangeLimit,
      if (tickSize != null) 'tickSize': tickSize,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TickSizeImpl extends TickSize {
  _TickSizeImpl({
    double? leftRangeLimit,
    double? tickSize,
  }) : super._(
          leftRangeLimit: leftRangeLimit,
          tickSize: tickSize,
        );

  @override
  TickSize copyWith({
    Object? leftRangeLimit = _Undefined,
    Object? tickSize = _Undefined,
  }) {
    return TickSize(
      leftRangeLimit:
          leftRangeLimit is double? ? leftRangeLimit : this.leftRangeLimit,
      tickSize: tickSize is double? ? tickSize : this.tickSize,
    );
  }
}
