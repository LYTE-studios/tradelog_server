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
import '../protocol.dart' as _i2;

abstract class MetatraderPosition
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MetatraderPosition._({
    required this.id,
    required this.type,
    required this.symbol,
    required this.magic,
    required this.time,
    required this.brokerTime,
    required this.updateTime,
    required this.openPrice,
    required this.currentPrice,
    required this.currentTickValue,
    this.stopLoss,
    this.takeProfit,
    this.trailingStopLoss,
    required this.volume,
    required this.profit,
    required this.realizedProfit,
    required this.unrealizedProfit,
    required this.commission,
    required this.realizedCommission,
    required this.unrealizedCommission,
    required this.swap,
    required this.realizedSwap,
    required this.unrealizedSwap,
    this.accountCurrencyExchangeRate,
    this.comment,
    this.clientId,
    required this.reason,
    this.brokerComment,
  });

  factory MetatraderPosition({
    required String id,
    required String type,
    required String symbol,
    required double magic,
    required DateTime time,
    required String brokerTime,
    required DateTime updateTime,
    required double openPrice,
    required double currentPrice,
    required double currentTickValue,
    double? stopLoss,
    double? takeProfit,
    _i2.TrailingStopLoss? trailingStopLoss,
    required double volume,
    required double profit,
    required double realizedProfit,
    required double unrealizedProfit,
    required double commission,
    required double realizedCommission,
    required double unrealizedCommission,
    required double swap,
    required double realizedSwap,
    required double unrealizedSwap,
    double? accountCurrencyExchangeRate,
    String? comment,
    String? clientId,
    required String reason,
    String? brokerComment,
  }) = _MetatraderPositionImpl;

  factory MetatraderPosition.fromJson(Map<String, dynamic> jsonSerialization) {
    return MetatraderPosition(
      id: jsonSerialization['id'] as String,
      type: jsonSerialization['type'] as String,
      symbol: jsonSerialization['symbol'] as String,
      magic: (jsonSerialization['magic'] as num).toDouble(),
      time: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['time']),
      brokerTime: jsonSerialization['brokerTime'] as String,
      updateTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updateTime']),
      openPrice: (jsonSerialization['openPrice'] as num).toDouble(),
      currentPrice: (jsonSerialization['currentPrice'] as num).toDouble(),
      currentTickValue:
          (jsonSerialization['currentTickValue'] as num).toDouble(),
      stopLoss: (jsonSerialization['stopLoss'] as num?)?.toDouble(),
      takeProfit: (jsonSerialization['takeProfit'] as num?)?.toDouble(),
      trailingStopLoss: jsonSerialization['trailingStopLoss'] == null
          ? null
          : _i2.TrailingStopLoss.fromJson(
              (jsonSerialization['trailingStopLoss'] as Map<String, dynamic>)),
      volume: (jsonSerialization['volume'] as num).toDouble(),
      profit: (jsonSerialization['profit'] as num).toDouble(),
      realizedProfit: (jsonSerialization['realizedProfit'] as num).toDouble(),
      unrealizedProfit:
          (jsonSerialization['unrealizedProfit'] as num).toDouble(),
      commission: (jsonSerialization['commission'] as num).toDouble(),
      realizedCommission:
          (jsonSerialization['realizedCommission'] as num).toDouble(),
      unrealizedCommission:
          (jsonSerialization['unrealizedCommission'] as num).toDouble(),
      swap: (jsonSerialization['swap'] as num).toDouble(),
      realizedSwap: (jsonSerialization['realizedSwap'] as num).toDouble(),
      unrealizedSwap: (jsonSerialization['unrealizedSwap'] as num).toDouble(),
      accountCurrencyExchangeRate:
          (jsonSerialization['accountCurrencyExchangeRate'] as num?)
              ?.toDouble(),
      comment: jsonSerialization['comment'] as String?,
      clientId: jsonSerialization['clientId'] as String?,
      reason: jsonSerialization['reason'] as String,
      brokerComment: jsonSerialization['brokerComment'] as String?,
    );
  }

  String id;

  String type;

  String symbol;

  double magic;

  DateTime time;

  String brokerTime;

  DateTime updateTime;

  double openPrice;

  double currentPrice;

  double currentTickValue;

  double? stopLoss;

  double? takeProfit;

  _i2.TrailingStopLoss? trailingStopLoss;

  double volume;

  double profit;

  double realizedProfit;

  double unrealizedProfit;

  double commission;

  double realizedCommission;

  double unrealizedCommission;

  double swap;

  double realizedSwap;

  double unrealizedSwap;

  double? accountCurrencyExchangeRate;

  String? comment;

  String? clientId;

  String reason;

  String? brokerComment;

  MetatraderPosition copyWith({
    String? id,
    String? type,
    String? symbol,
    double? magic,
    DateTime? time,
    String? brokerTime,
    DateTime? updateTime,
    double? openPrice,
    double? currentPrice,
    double? currentTickValue,
    double? stopLoss,
    double? takeProfit,
    _i2.TrailingStopLoss? trailingStopLoss,
    double? volume,
    double? profit,
    double? realizedProfit,
    double? unrealizedProfit,
    double? commission,
    double? realizedCommission,
    double? unrealizedCommission,
    double? swap,
    double? realizedSwap,
    double? unrealizedSwap,
    double? accountCurrencyExchangeRate,
    String? comment,
    String? clientId,
    String? reason,
    String? brokerComment,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'symbol': symbol,
      'magic': magic,
      'time': time.toJson(),
      'brokerTime': brokerTime,
      'updateTime': updateTime.toJson(),
      'openPrice': openPrice,
      'currentPrice': currentPrice,
      'currentTickValue': currentTickValue,
      if (stopLoss != null) 'stopLoss': stopLoss,
      if (takeProfit != null) 'takeProfit': takeProfit,
      if (trailingStopLoss != null)
        'trailingStopLoss': trailingStopLoss?.toJson(),
      'volume': volume,
      'profit': profit,
      'realizedProfit': realizedProfit,
      'unrealizedProfit': unrealizedProfit,
      'commission': commission,
      'realizedCommission': realizedCommission,
      'unrealizedCommission': unrealizedCommission,
      'swap': swap,
      'realizedSwap': realizedSwap,
      'unrealizedSwap': unrealizedSwap,
      if (accountCurrencyExchangeRate != null)
        'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
      if (comment != null) 'comment': comment,
      if (clientId != null) 'clientId': clientId,
      'reason': reason,
      if (brokerComment != null) 'brokerComment': brokerComment,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'type': type,
      'symbol': symbol,
      'magic': magic,
      'time': time.toJson(),
      'brokerTime': brokerTime,
      'updateTime': updateTime.toJson(),
      'openPrice': openPrice,
      'currentPrice': currentPrice,
      'currentTickValue': currentTickValue,
      if (stopLoss != null) 'stopLoss': stopLoss,
      if (takeProfit != null) 'takeProfit': takeProfit,
      if (trailingStopLoss != null)
        'trailingStopLoss': trailingStopLoss?.toJsonForProtocol(),
      'volume': volume,
      'profit': profit,
      'realizedProfit': realizedProfit,
      'unrealizedProfit': unrealizedProfit,
      'commission': commission,
      'realizedCommission': realizedCommission,
      'unrealizedCommission': unrealizedCommission,
      'swap': swap,
      'realizedSwap': realizedSwap,
      'unrealizedSwap': unrealizedSwap,
      if (accountCurrencyExchangeRate != null)
        'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
      if (comment != null) 'comment': comment,
      if (clientId != null) 'clientId': clientId,
      'reason': reason,
      if (brokerComment != null) 'brokerComment': brokerComment,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MetatraderPositionImpl extends MetatraderPosition {
  _MetatraderPositionImpl({
    required String id,
    required String type,
    required String symbol,
    required double magic,
    required DateTime time,
    required String brokerTime,
    required DateTime updateTime,
    required double openPrice,
    required double currentPrice,
    required double currentTickValue,
    double? stopLoss,
    double? takeProfit,
    _i2.TrailingStopLoss? trailingStopLoss,
    required double volume,
    required double profit,
    required double realizedProfit,
    required double unrealizedProfit,
    required double commission,
    required double realizedCommission,
    required double unrealizedCommission,
    required double swap,
    required double realizedSwap,
    required double unrealizedSwap,
    double? accountCurrencyExchangeRate,
    String? comment,
    String? clientId,
    required String reason,
    String? brokerComment,
  }) : super._(
          id: id,
          type: type,
          symbol: symbol,
          magic: magic,
          time: time,
          brokerTime: brokerTime,
          updateTime: updateTime,
          openPrice: openPrice,
          currentPrice: currentPrice,
          currentTickValue: currentTickValue,
          stopLoss: stopLoss,
          takeProfit: takeProfit,
          trailingStopLoss: trailingStopLoss,
          volume: volume,
          profit: profit,
          realizedProfit: realizedProfit,
          unrealizedProfit: unrealizedProfit,
          commission: commission,
          realizedCommission: realizedCommission,
          unrealizedCommission: unrealizedCommission,
          swap: swap,
          realizedSwap: realizedSwap,
          unrealizedSwap: unrealizedSwap,
          accountCurrencyExchangeRate: accountCurrencyExchangeRate,
          comment: comment,
          clientId: clientId,
          reason: reason,
          brokerComment: brokerComment,
        );

  @override
  MetatraderPosition copyWith({
    String? id,
    String? type,
    String? symbol,
    double? magic,
    DateTime? time,
    String? brokerTime,
    DateTime? updateTime,
    double? openPrice,
    double? currentPrice,
    double? currentTickValue,
    Object? stopLoss = _Undefined,
    Object? takeProfit = _Undefined,
    Object? trailingStopLoss = _Undefined,
    double? volume,
    double? profit,
    double? realizedProfit,
    double? unrealizedProfit,
    double? commission,
    double? realizedCommission,
    double? unrealizedCommission,
    double? swap,
    double? realizedSwap,
    double? unrealizedSwap,
    Object? accountCurrencyExchangeRate = _Undefined,
    Object? comment = _Undefined,
    Object? clientId = _Undefined,
    String? reason,
    Object? brokerComment = _Undefined,
  }) {
    return MetatraderPosition(
      id: id ?? this.id,
      type: type ?? this.type,
      symbol: symbol ?? this.symbol,
      magic: magic ?? this.magic,
      time: time ?? this.time,
      brokerTime: brokerTime ?? this.brokerTime,
      updateTime: updateTime ?? this.updateTime,
      openPrice: openPrice ?? this.openPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      currentTickValue: currentTickValue ?? this.currentTickValue,
      stopLoss: stopLoss is double? ? stopLoss : this.stopLoss,
      takeProfit: takeProfit is double? ? takeProfit : this.takeProfit,
      trailingStopLoss: trailingStopLoss is _i2.TrailingStopLoss?
          ? trailingStopLoss
          : this.trailingStopLoss?.copyWith(),
      volume: volume ?? this.volume,
      profit: profit ?? this.profit,
      realizedProfit: realizedProfit ?? this.realizedProfit,
      unrealizedProfit: unrealizedProfit ?? this.unrealizedProfit,
      commission: commission ?? this.commission,
      realizedCommission: realizedCommission ?? this.realizedCommission,
      unrealizedCommission: unrealizedCommission ?? this.unrealizedCommission,
      swap: swap ?? this.swap,
      realizedSwap: realizedSwap ?? this.realizedSwap,
      unrealizedSwap: unrealizedSwap ?? this.unrealizedSwap,
      accountCurrencyExchangeRate: accountCurrencyExchangeRate is double?
          ? accountCurrencyExchangeRate
          : this.accountCurrencyExchangeRate,
      comment: comment is String? ? comment : this.comment,
      clientId: clientId is String? ? clientId : this.clientId,
      reason: reason ?? this.reason,
      brokerComment:
          brokerComment is String? ? brokerComment : this.brokerComment,
    );
  }
}
