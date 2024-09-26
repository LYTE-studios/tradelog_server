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

abstract class TradelockerOrder
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradelockerOrder._({
    required this.id,
    required this.tradableInstrumentId,
    required this.routeId,
    required this.qty,
    required this.side,
    required this.type,
    required this.status,
    required this.filledQty,
    required this.avgPrice,
    required this.price,
    this.stopPrice,
    required this.validity,
    this.expireDate,
    required this.createdDate,
    required this.lastModified,
    required this.isOpen,
    this.positionId,
    this.stopLoss,
    this.stopLossType,
    this.takeProfit,
    this.takeProfitType,
    this.strategyId,
  });

  factory TradelockerOrder({
    required String id,
    required int tradableInstrumentId,
    required int routeId,
    required double qty,
    required String side,
    required String type,
    required String status,
    required double filledQty,
    required double avgPrice,
    required double price,
    double? stopPrice,
    required String validity,
    DateTime? expireDate,
    required DateTime createdDate,
    required DateTime lastModified,
    required bool isOpen,
    String? positionId,
    double? stopLoss,
    String? stopLossType,
    double? takeProfit,
    String? takeProfitType,
    String? strategyId,
  }) = _TradelockerOrderImpl;

  factory TradelockerOrder.fromJson(Map<String, dynamic> jsonSerialization) {
    return TradelockerOrder(
      id: jsonSerialization['id'] as String,
      tradableInstrumentId: jsonSerialization['tradableInstrumentId'] as int,
      routeId: jsonSerialization['routeId'] as int,
      qty: (jsonSerialization['qty'] as num).toDouble(),
      side: jsonSerialization['side'] as String,
      type: jsonSerialization['type'] as String,
      status: jsonSerialization['status'] as String,
      filledQty: (jsonSerialization['filledQty'] as num).toDouble(),
      avgPrice: (jsonSerialization['avgPrice'] as num).toDouble(),
      price: (jsonSerialization['price'] as num).toDouble(),
      stopPrice: (jsonSerialization['stopPrice'] as num?)?.toDouble(),
      validity: jsonSerialization['validity'] as String,
      expireDate: jsonSerialization['expireDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expireDate']),
      createdDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdDate']),
      lastModified:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastModified']),
      isOpen: jsonSerialization['isOpen'] as bool,
      positionId: jsonSerialization['positionId'] as String?,
      stopLoss: (jsonSerialization['stopLoss'] as num?)?.toDouble(),
      stopLossType: jsonSerialization['stopLossType'] as String?,
      takeProfit: (jsonSerialization['takeProfit'] as num?)?.toDouble(),
      takeProfitType: jsonSerialization['takeProfitType'] as String?,
      strategyId: jsonSerialization['strategyId'] as String?,
    );
  }

  String id;

  int tradableInstrumentId;

  int routeId;

  double qty;

  String side;

  String type;

  String status;

  double filledQty;

  double avgPrice;

  double price;

  double? stopPrice;

  String validity;

  DateTime? expireDate;

  DateTime createdDate;

  DateTime lastModified;

  bool isOpen;

  String? positionId;

  double? stopLoss;

  String? stopLossType;

  double? takeProfit;

  String? takeProfitType;

  String? strategyId;

  TradelockerOrder copyWith({
    String? id,
    int? tradableInstrumentId,
    int? routeId,
    double? qty,
    String? side,
    String? type,
    String? status,
    double? filledQty,
    double? avgPrice,
    double? price,
    double? stopPrice,
    String? validity,
    DateTime? expireDate,
    DateTime? createdDate,
    DateTime? lastModified,
    bool? isOpen,
    String? positionId,
    double? stopLoss,
    String? stopLossType,
    double? takeProfit,
    String? takeProfitType,
    String? strategyId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tradableInstrumentId': tradableInstrumentId,
      'routeId': routeId,
      'qty': qty,
      'side': side,
      'type': type,
      'status': status,
      'filledQty': filledQty,
      'avgPrice': avgPrice,
      'price': price,
      if (stopPrice != null) 'stopPrice': stopPrice,
      'validity': validity,
      if (expireDate != null) 'expireDate': expireDate?.toJson(),
      'createdDate': createdDate.toJson(),
      'lastModified': lastModified.toJson(),
      'isOpen': isOpen,
      if (positionId != null) 'positionId': positionId,
      if (stopLoss != null) 'stopLoss': stopLoss,
      if (stopLossType != null) 'stopLossType': stopLossType,
      if (takeProfit != null) 'takeProfit': takeProfit,
      if (takeProfitType != null) 'takeProfitType': takeProfitType,
      if (strategyId != null) 'strategyId': strategyId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'tradableInstrumentId': tradableInstrumentId,
      'routeId': routeId,
      'qty': qty,
      'side': side,
      'type': type,
      'status': status,
      'filledQty': filledQty,
      'avgPrice': avgPrice,
      'price': price,
      if (stopPrice != null) 'stopPrice': stopPrice,
      'validity': validity,
      if (expireDate != null) 'expireDate': expireDate?.toJson(),
      'createdDate': createdDate.toJson(),
      'lastModified': lastModified.toJson(),
      'isOpen': isOpen,
      if (positionId != null) 'positionId': positionId,
      if (stopLoss != null) 'stopLoss': stopLoss,
      if (stopLossType != null) 'stopLossType': stopLossType,
      if (takeProfit != null) 'takeProfit': takeProfit,
      if (takeProfitType != null) 'takeProfitType': takeProfitType,
      if (strategyId != null) 'strategyId': strategyId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TradelockerOrderImpl extends TradelockerOrder {
  _TradelockerOrderImpl({
    required String id,
    required int tradableInstrumentId,
    required int routeId,
    required double qty,
    required String side,
    required String type,
    required String status,
    required double filledQty,
    required double avgPrice,
    required double price,
    double? stopPrice,
    required String validity,
    DateTime? expireDate,
    required DateTime createdDate,
    required DateTime lastModified,
    required bool isOpen,
    String? positionId,
    double? stopLoss,
    String? stopLossType,
    double? takeProfit,
    String? takeProfitType,
    String? strategyId,
  }) : super._(
          id: id,
          tradableInstrumentId: tradableInstrumentId,
          routeId: routeId,
          qty: qty,
          side: side,
          type: type,
          status: status,
          filledQty: filledQty,
          avgPrice: avgPrice,
          price: price,
          stopPrice: stopPrice,
          validity: validity,
          expireDate: expireDate,
          createdDate: createdDate,
          lastModified: lastModified,
          isOpen: isOpen,
          positionId: positionId,
          stopLoss: stopLoss,
          stopLossType: stopLossType,
          takeProfit: takeProfit,
          takeProfitType: takeProfitType,
          strategyId: strategyId,
        );

  @override
  TradelockerOrder copyWith({
    String? id,
    int? tradableInstrumentId,
    int? routeId,
    double? qty,
    String? side,
    String? type,
    String? status,
    double? filledQty,
    double? avgPrice,
    double? price,
    Object? stopPrice = _Undefined,
    String? validity,
    Object? expireDate = _Undefined,
    DateTime? createdDate,
    DateTime? lastModified,
    bool? isOpen,
    Object? positionId = _Undefined,
    Object? stopLoss = _Undefined,
    Object? stopLossType = _Undefined,
    Object? takeProfit = _Undefined,
    Object? takeProfitType = _Undefined,
    Object? strategyId = _Undefined,
  }) {
    return TradelockerOrder(
      id: id ?? this.id,
      tradableInstrumentId: tradableInstrumentId ?? this.tradableInstrumentId,
      routeId: routeId ?? this.routeId,
      qty: qty ?? this.qty,
      side: side ?? this.side,
      type: type ?? this.type,
      status: status ?? this.status,
      filledQty: filledQty ?? this.filledQty,
      avgPrice: avgPrice ?? this.avgPrice,
      price: price ?? this.price,
      stopPrice: stopPrice is double? ? stopPrice : this.stopPrice,
      validity: validity ?? this.validity,
      expireDate: expireDate is DateTime? ? expireDate : this.expireDate,
      createdDate: createdDate ?? this.createdDate,
      lastModified: lastModified ?? this.lastModified,
      isOpen: isOpen ?? this.isOpen,
      positionId: positionId is String? ? positionId : this.positionId,
      stopLoss: stopLoss is double? ? stopLoss : this.stopLoss,
      stopLossType: stopLossType is String? ? stopLossType : this.stopLossType,
      takeProfit: takeProfit is double? ? takeProfit : this.takeProfit,
      takeProfitType:
          takeProfitType is String? ? takeProfitType : this.takeProfitType,
      strategyId: strategyId is String? ? strategyId : this.strategyId,
    );
  }
}
