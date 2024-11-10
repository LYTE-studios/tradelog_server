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

abstract class TradeDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradeDto._({
    this.linkedAccountId,
    required this.option,
    required this.currency,
    required this.fee,
    required this.date,
    required this.lotSize,
    required this.takeProfit,
    required this.stoploss,
    required this.profitLoss,
    required this.amount,
  });

  factory TradeDto({
    int? linkedAccountId,
    required _i2.Option option,
    required String currency,
    required double fee,
    required DateTime date,
    required double lotSize,
    required double takeProfit,
    required double stoploss,
    required String profitLoss,
    required double amount,
  }) = _TradeDtoImpl;

  factory TradeDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TradeDto(
      linkedAccountId: jsonSerialization['linkedAccountId'] as int?,
      option: _i2.Option.fromJson((jsonSerialization['option'] as int)),
      currency: jsonSerialization['currency'] as String,
      fee: (jsonSerialization['fee'] as num).toDouble(),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      lotSize: (jsonSerialization['lotSize'] as num).toDouble(),
      takeProfit: (jsonSerialization['takeProfit'] as num).toDouble(),
      stoploss: (jsonSerialization['stoploss'] as num).toDouble(),
      profitLoss: jsonSerialization['profitLoss'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
    );
  }

  int? linkedAccountId;

  _i2.Option option;

  String currency;

  double fee;

  DateTime date;

  double lotSize;

  double takeProfit;

  double stoploss;

  String profitLoss;

  double amount;

  TradeDto copyWith({
    int? linkedAccountId,
    _i2.Option? option,
    String? currency,
    double? fee,
    DateTime? date,
    double? lotSize,
    double? takeProfit,
    double? stoploss,
    String? profitLoss,
    double? amount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (linkedAccountId != null) 'linkedAccountId': linkedAccountId,
      'option': option.toJson(),
      'currency': currency,
      'fee': fee,
      'date': date.toJson(),
      'lotSize': lotSize,
      'takeProfit': takeProfit,
      'stoploss': stoploss,
      'profitLoss': profitLoss,
      'amount': amount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (linkedAccountId != null) 'linkedAccountId': linkedAccountId,
      'option': option.toJson(),
      'currency': currency,
      'fee': fee,
      'date': date.toJson(),
      'lotSize': lotSize,
      'takeProfit': takeProfit,
      'stoploss': stoploss,
      'profitLoss': profitLoss,
      'amount': amount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TradeDtoImpl extends TradeDto {
  _TradeDtoImpl({
    int? linkedAccountId,
    required _i2.Option option,
    required String currency,
    required double fee,
    required DateTime date,
    required double lotSize,
    required double takeProfit,
    required double stoploss,
    required String profitLoss,
    required double amount,
  }) : super._(
          linkedAccountId: linkedAccountId,
          option: option,
          currency: currency,
          fee: fee,
          date: date,
          lotSize: lotSize,
          takeProfit: takeProfit,
          stoploss: stoploss,
          profitLoss: profitLoss,
          amount: amount,
        );

  @override
  TradeDto copyWith({
    Object? linkedAccountId = _Undefined,
    _i2.Option? option,
    String? currency,
    double? fee,
    DateTime? date,
    double? lotSize,
    double? takeProfit,
    double? stoploss,
    String? profitLoss,
    double? amount,
  }) {
    return TradeDto(
      linkedAccountId:
          linkedAccountId is int? ? linkedAccountId : this.linkedAccountId,
      option: option ?? this.option,
      currency: currency ?? this.currency,
      fee: fee ?? this.fee,
      date: date ?? this.date,
      lotSize: lotSize ?? this.lotSize,
      takeProfit: takeProfit ?? this.takeProfit,
      stoploss: stoploss ?? this.stoploss,
      profitLoss: profitLoss ?? this.profitLoss,
      amount: amount ?? this.amount,
    );
  }
}
