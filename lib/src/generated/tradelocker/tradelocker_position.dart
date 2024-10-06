/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class TradelockerPosition
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradelockerPosition._({
    required this.id,
    required this.tradableInstrumentId,
    required this.routeId,
    required this.side,
    required this.quantity,
    required this.avgPrice,
    this.stopLossId,
    this.takeProfitId,
    required this.openDate,
    required this.unrealizedPl,
    this.strategyId,
  });

  factory TradelockerPosition({
    required String id,
    required int tradableInstrumentId,
    required int routeId,
    required String side,
    required double quantity,
    required double avgPrice,
    String? stopLossId,
    String? takeProfitId,
    required DateTime openDate,
    required double unrealizedPl,
    String? strategyId,
  }) = _TradelockerPositionImpl;

  factory TradelockerPosition.fromJson(Map<String, dynamic> jsonSerialization) {
    return TradelockerPosition(
      id: jsonSerialization['id'] as String,
      tradableInstrumentId: jsonSerialization['tradableInstrumentId'] as int,
      routeId: jsonSerialization['routeId'] as int,
      side: jsonSerialization['side'] as String,
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
      avgPrice: (jsonSerialization['avgPrice'] as num).toDouble(),
      stopLossId: jsonSerialization['stopLossId'] as String?,
      takeProfitId: jsonSerialization['takeProfitId'] as String?,
      openDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['openDate']),
      unrealizedPl: (jsonSerialization['unrealizedPl'] as num).toDouble(),
      strategyId: jsonSerialization['strategyId'] as String?,
    );
  }

  String id;

  int tradableInstrumentId;

  int routeId;

  String side;

  double quantity;

  double avgPrice;

  String? stopLossId;

  String? takeProfitId;

  DateTime openDate;

  double unrealizedPl;

  String? strategyId;

  TradelockerPosition copyWith({
    String? id,
    int? tradableInstrumentId,
    int? routeId,
    String? side,
    double? quantity,
    double? avgPrice,
    String? stopLossId,
    String? takeProfitId,
    DateTime? openDate,
    double? unrealizedPl,
    String? strategyId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tradableInstrumentId': tradableInstrumentId,
      'routeId': routeId,
      'side': side,
      'quantity': quantity,
      'avgPrice': avgPrice,
      if (stopLossId != null) 'stopLossId': stopLossId,
      if (takeProfitId != null) 'takeProfitId': takeProfitId,
      'openDate': openDate.toJson(),
      'unrealizedPl': unrealizedPl,
      if (strategyId != null) 'strategyId': strategyId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'tradableInstrumentId': tradableInstrumentId,
      'routeId': routeId,
      'side': side,
      'quantity': quantity,
      'avgPrice': avgPrice,
      if (stopLossId != null) 'stopLossId': stopLossId,
      if (takeProfitId != null) 'takeProfitId': takeProfitId,
      'openDate': openDate.toJson(),
      'unrealizedPl': unrealizedPl,
      if (strategyId != null) 'strategyId': strategyId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TradelockerPositionImpl extends TradelockerPosition {
  _TradelockerPositionImpl({
    required String id,
    required int tradableInstrumentId,
    required int routeId,
    required String side,
    required double quantity,
    required double avgPrice,
    String? stopLossId,
    String? takeProfitId,
    required DateTime openDate,
    required double unrealizedPl,
    String? strategyId,
  }) : super._(
          id: id,
          tradableInstrumentId: tradableInstrumentId,
          routeId: routeId,
          side: side,
          quantity: quantity,
          avgPrice: avgPrice,
          stopLossId: stopLossId,
          takeProfitId: takeProfitId,
          openDate: openDate,
          unrealizedPl: unrealizedPl,
          strategyId: strategyId,
        );

  @override
  TradelockerPosition copyWith({
    String? id,
    int? tradableInstrumentId,
    int? routeId,
    String? side,
    double? quantity,
    double? avgPrice,
    Object? stopLossId = _Undefined,
    Object? takeProfitId = _Undefined,
    DateTime? openDate,
    double? unrealizedPl,
    Object? strategyId = _Undefined,
  }) {
    return TradelockerPosition(
      id: id ?? this.id,
      tradableInstrumentId: tradableInstrumentId ?? this.tradableInstrumentId,
      routeId: routeId ?? this.routeId,
      side: side ?? this.side,
      quantity: quantity ?? this.quantity,
      avgPrice: avgPrice ?? this.avgPrice,
      stopLossId: stopLossId is String? ? stopLossId : this.stopLossId,
      takeProfitId: takeProfitId is String? ? takeProfitId : this.takeProfitId,
      openDate: openDate ?? this.openDate,
      unrealizedPl: unrealizedPl ?? this.unrealizedPl,
      strategyId: strategyId is String? ? strategyId : this.strategyId,
    );
  }
}
