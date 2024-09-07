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

abstract class MetatraderOrder
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MetatraderOrder._({
    required this.id,
    required this.type,
    required this.state,
    required this.magic,
    required this.time,
    required this.brokerTime,
    this.doneTime,
    this.doneBrokerTime,
    required this.symbol,
    this.openPrice,
    this.stopLimitPrice,
    this.currentPrice,
    this.stopLoss,
    this.takeProfit,
    this.trailingStopLoss,
    required this.volume,
    required this.currentVolume,
    this.positionId,
    this.comment,
    this.brokerComment,
    this.clientId,
    required this.platform,
    required this.reason,
    required this.fillingMode,
    required this.expirationType,
    this.expirationTime,
    this.accountCurrencyExchangeRate,
    this.closeByPositionId,
  });

  factory MetatraderOrder({
    required String id,
    required String type,
    required String state,
    required double magic,
    required DateTime time,
    required String brokerTime,
    DateTime? doneTime,
    String? doneBrokerTime,
    required String symbol,
    double? openPrice,
    double? stopLimitPrice,
    double? currentPrice,
    double? stopLoss,
    double? takeProfit,
    _i2.TrailingStopLoss? trailingStopLoss,
    required double volume,
    required double currentVolume,
    String? positionId,
    String? comment,
    String? brokerComment,
    String? clientId,
    required String platform,
    required String reason,
    required String fillingMode,
    required String expirationType,
    DateTime? expirationTime,
    double? accountCurrencyExchangeRate,
    String? closeByPositionId,
  }) = _MetatraderOrderImpl;

  factory MetatraderOrder.fromJson(Map<String, dynamic> jsonSerialization) {
    return MetatraderOrder(
      id: jsonSerialization['id'] as String,
      type: jsonSerialization['type'] as String,
      state: jsonSerialization['state'] as String,
      magic: (jsonSerialization['magic'] as num).toDouble(),
      time: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['time']),
      brokerTime: jsonSerialization['brokerTime'] as String,
      doneTime: jsonSerialization['doneTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['doneTime']),
      doneBrokerTime: jsonSerialization['doneBrokerTime'] as String?,
      symbol: jsonSerialization['symbol'] as String,
      openPrice: (jsonSerialization['openPrice'] as num?)?.toDouble(),
      stopLimitPrice: (jsonSerialization['stopLimitPrice'] as num?)?.toDouble(),
      currentPrice: (jsonSerialization['currentPrice'] as num?)?.toDouble(),
      stopLoss: (jsonSerialization['stopLoss'] as num?)?.toDouble(),
      takeProfit: (jsonSerialization['takeProfit'] as num?)?.toDouble(),
      trailingStopLoss: jsonSerialization['trailingStopLoss'] == null
          ? null
          : _i2.TrailingStopLoss.fromJson(
              (jsonSerialization['trailingStopLoss'] as Map<String, dynamic>)),
      volume: (jsonSerialization['volume'] as num).toDouble(),
      currentVolume: (jsonSerialization['currentVolume'] as num).toDouble(),
      positionId: jsonSerialization['positionId'] as String?,
      comment: jsonSerialization['comment'] as String?,
      brokerComment: jsonSerialization['brokerComment'] as String?,
      clientId: jsonSerialization['clientId'] as String?,
      platform: jsonSerialization['platform'] as String,
      reason: jsonSerialization['reason'] as String,
      fillingMode: jsonSerialization['fillingMode'] as String,
      expirationType: jsonSerialization['expirationType'] as String,
      expirationTime: jsonSerialization['expirationTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['expirationTime']),
      accountCurrencyExchangeRate:
          (jsonSerialization['accountCurrencyExchangeRate'] as num?)
              ?.toDouble(),
      closeByPositionId: jsonSerialization['closeByPositionId'] as String?,
    );
  }

  String id;

  String type;

  String state;

  double magic;

  DateTime time;

  String brokerTime;

  DateTime? doneTime;

  String? doneBrokerTime;

  String symbol;

  double? openPrice;

  double? stopLimitPrice;

  double? currentPrice;

  double? stopLoss;

  double? takeProfit;

  _i2.TrailingStopLoss? trailingStopLoss;

  double volume;

  double currentVolume;

  String? positionId;

  String? comment;

  String? brokerComment;

  String? clientId;

  String platform;

  String reason;

  String fillingMode;

  String expirationType;

  DateTime? expirationTime;

  double? accountCurrencyExchangeRate;

  String? closeByPositionId;

  MetatraderOrder copyWith({
    String? id,
    String? type,
    String? state,
    double? magic,
    DateTime? time,
    String? brokerTime,
    DateTime? doneTime,
    String? doneBrokerTime,
    String? symbol,
    double? openPrice,
    double? stopLimitPrice,
    double? currentPrice,
    double? stopLoss,
    double? takeProfit,
    _i2.TrailingStopLoss? trailingStopLoss,
    double? volume,
    double? currentVolume,
    String? positionId,
    String? comment,
    String? brokerComment,
    String? clientId,
    String? platform,
    String? reason,
    String? fillingMode,
    String? expirationType,
    DateTime? expirationTime,
    double? accountCurrencyExchangeRate,
    String? closeByPositionId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'state': state,
      'magic': magic,
      'time': time.toJson(),
      'brokerTime': brokerTime,
      if (doneTime != null) 'doneTime': doneTime?.toJson(),
      if (doneBrokerTime != null) 'doneBrokerTime': doneBrokerTime,
      'symbol': symbol,
      if (openPrice != null) 'openPrice': openPrice,
      if (stopLimitPrice != null) 'stopLimitPrice': stopLimitPrice,
      if (currentPrice != null) 'currentPrice': currentPrice,
      if (stopLoss != null) 'stopLoss': stopLoss,
      if (takeProfit != null) 'takeProfit': takeProfit,
      if (trailingStopLoss != null)
        'trailingStopLoss': trailingStopLoss?.toJson(),
      'volume': volume,
      'currentVolume': currentVolume,
      if (positionId != null) 'positionId': positionId,
      if (comment != null) 'comment': comment,
      if (brokerComment != null) 'brokerComment': brokerComment,
      if (clientId != null) 'clientId': clientId,
      'platform': platform,
      'reason': reason,
      'fillingMode': fillingMode,
      'expirationType': expirationType,
      if (expirationTime != null) 'expirationTime': expirationTime?.toJson(),
      if (accountCurrencyExchangeRate != null)
        'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
      if (closeByPositionId != null) 'closeByPositionId': closeByPositionId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'type': type,
      'state': state,
      'magic': magic,
      'time': time.toJson(),
      'brokerTime': brokerTime,
      if (doneTime != null) 'doneTime': doneTime?.toJson(),
      if (doneBrokerTime != null) 'doneBrokerTime': doneBrokerTime,
      'symbol': symbol,
      if (openPrice != null) 'openPrice': openPrice,
      if (stopLimitPrice != null) 'stopLimitPrice': stopLimitPrice,
      if (currentPrice != null) 'currentPrice': currentPrice,
      if (stopLoss != null) 'stopLoss': stopLoss,
      if (takeProfit != null) 'takeProfit': takeProfit,
      if (trailingStopLoss != null)
        'trailingStopLoss': trailingStopLoss?.toJsonForProtocol(),
      'volume': volume,
      'currentVolume': currentVolume,
      if (positionId != null) 'positionId': positionId,
      if (comment != null) 'comment': comment,
      if (brokerComment != null) 'brokerComment': brokerComment,
      if (clientId != null) 'clientId': clientId,
      'platform': platform,
      'reason': reason,
      'fillingMode': fillingMode,
      'expirationType': expirationType,
      if (expirationTime != null) 'expirationTime': expirationTime?.toJson(),
      if (accountCurrencyExchangeRate != null)
        'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
      if (closeByPositionId != null) 'closeByPositionId': closeByPositionId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MetatraderOrderImpl extends MetatraderOrder {
  _MetatraderOrderImpl({
    required String id,
    required String type,
    required String state,
    required double magic,
    required DateTime time,
    required String brokerTime,
    DateTime? doneTime,
    String? doneBrokerTime,
    required String symbol,
    double? openPrice,
    double? stopLimitPrice,
    double? currentPrice,
    double? stopLoss,
    double? takeProfit,
    _i2.TrailingStopLoss? trailingStopLoss,
    required double volume,
    required double currentVolume,
    String? positionId,
    String? comment,
    String? brokerComment,
    String? clientId,
    required String platform,
    required String reason,
    required String fillingMode,
    required String expirationType,
    DateTime? expirationTime,
    double? accountCurrencyExchangeRate,
    String? closeByPositionId,
  }) : super._(
          id: id,
          type: type,
          state: state,
          magic: magic,
          time: time,
          brokerTime: brokerTime,
          doneTime: doneTime,
          doneBrokerTime: doneBrokerTime,
          symbol: symbol,
          openPrice: openPrice,
          stopLimitPrice: stopLimitPrice,
          currentPrice: currentPrice,
          stopLoss: stopLoss,
          takeProfit: takeProfit,
          trailingStopLoss: trailingStopLoss,
          volume: volume,
          currentVolume: currentVolume,
          positionId: positionId,
          comment: comment,
          brokerComment: brokerComment,
          clientId: clientId,
          platform: platform,
          reason: reason,
          fillingMode: fillingMode,
          expirationType: expirationType,
          expirationTime: expirationTime,
          accountCurrencyExchangeRate: accountCurrencyExchangeRate,
          closeByPositionId: closeByPositionId,
        );

  @override
  MetatraderOrder copyWith({
    String? id,
    String? type,
    String? state,
    double? magic,
    DateTime? time,
    String? brokerTime,
    Object? doneTime = _Undefined,
    Object? doneBrokerTime = _Undefined,
    String? symbol,
    Object? openPrice = _Undefined,
    Object? stopLimitPrice = _Undefined,
    Object? currentPrice = _Undefined,
    Object? stopLoss = _Undefined,
    Object? takeProfit = _Undefined,
    Object? trailingStopLoss = _Undefined,
    double? volume,
    double? currentVolume,
    Object? positionId = _Undefined,
    Object? comment = _Undefined,
    Object? brokerComment = _Undefined,
    Object? clientId = _Undefined,
    String? platform,
    String? reason,
    String? fillingMode,
    String? expirationType,
    Object? expirationTime = _Undefined,
    Object? accountCurrencyExchangeRate = _Undefined,
    Object? closeByPositionId = _Undefined,
  }) {
    return MetatraderOrder(
      id: id ?? this.id,
      type: type ?? this.type,
      state: state ?? this.state,
      magic: magic ?? this.magic,
      time: time ?? this.time,
      brokerTime: brokerTime ?? this.brokerTime,
      doneTime: doneTime is DateTime? ? doneTime : this.doneTime,
      doneBrokerTime:
          doneBrokerTime is String? ? doneBrokerTime : this.doneBrokerTime,
      symbol: symbol ?? this.symbol,
      openPrice: openPrice is double? ? openPrice : this.openPrice,
      stopLimitPrice:
          stopLimitPrice is double? ? stopLimitPrice : this.stopLimitPrice,
      currentPrice: currentPrice is double? ? currentPrice : this.currentPrice,
      stopLoss: stopLoss is double? ? stopLoss : this.stopLoss,
      takeProfit: takeProfit is double? ? takeProfit : this.takeProfit,
      trailingStopLoss: trailingStopLoss is _i2.TrailingStopLoss?
          ? trailingStopLoss
          : this.trailingStopLoss?.copyWith(),
      volume: volume ?? this.volume,
      currentVolume: currentVolume ?? this.currentVolume,
      positionId: positionId is String? ? positionId : this.positionId,
      comment: comment is String? ? comment : this.comment,
      brokerComment:
          brokerComment is String? ? brokerComment : this.brokerComment,
      clientId: clientId is String? ? clientId : this.clientId,
      platform: platform ?? this.platform,
      reason: reason ?? this.reason,
      fillingMode: fillingMode ?? this.fillingMode,
      expirationType: expirationType ?? this.expirationType,
      expirationTime:
          expirationTime is DateTime? ? expirationTime : this.expirationTime,
      accountCurrencyExchangeRate: accountCurrencyExchangeRate is double?
          ? accountCurrencyExchangeRate
          : this.accountCurrencyExchangeRate,
      closeByPositionId: closeByPositionId is String?
          ? closeByPositionId
          : this.closeByPositionId,
    );
  }
}
