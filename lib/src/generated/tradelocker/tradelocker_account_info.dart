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

abstract class TradelockerAccountInformation
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradelockerAccountInformation._({
    required this.id,
    required this.currency,
    required this.name,
    required this.riskRules,
    required this.status,
    required this.tradingRules,
    required this.type,
  });

  factory TradelockerAccountInformation({
    required String id,
    required String currency,
    required String name,
    required _i2.RiskRules riskRules,
    required String status,
    required _i2.TradingRules tradingRules,
    required String type,
  }) = _TradelockerAccountInformationImpl;

  factory TradelockerAccountInformation.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return TradelockerAccountInformation(
      id: jsonSerialization['id'] as String,
      currency: jsonSerialization['currency'] as String,
      name: jsonSerialization['name'] as String,
      riskRules: _i2.RiskRules.fromJson(
          (jsonSerialization['riskRules'] as Map<String, dynamic>)),
      status: jsonSerialization['status'] as String,
      tradingRules: _i2.TradingRules.fromJson(
          (jsonSerialization['tradingRules'] as Map<String, dynamic>)),
      type: jsonSerialization['type'] as String,
    );
  }

  String currency;

  String id;

  String name;

  _i2.RiskRules riskRules;

  String status;

  _i2.TradingRules tradingRules;

  String type;

  TradelockerAccountInformation copyWith({
    String? id,
    String? currency,
    String? name,
    _i2.RiskRules? riskRules,
    String? status,
    _i2.TradingRules? tradingRules,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'currency': currency,
      'name': name,
      'riskRules': riskRules.toJson(),
      'status': status,
      'tradingRules': tradingRules.toJson(),
      'type': type,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'currency': currency,
      'name': name,
      'riskRules': riskRules.toJsonForProtocol(),
      'status': status,
      'tradingRules': tradingRules.toJsonForProtocol(),
      'type': type,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TradelockerAccountInformationImpl extends TradelockerAccountInformation {
  _TradelockerAccountInformationImpl({
    required String id,
    required String currency,
    required String name,
    required _i2.RiskRules riskRules,
    required String status,
    required _i2.TradingRules tradingRules,
    required String type,
  }) : super._(
          id: id,
          currency: currency,
          name: name,
          riskRules: riskRules,
          status: status,
          tradingRules: tradingRules,
          type: type,
        );

  @override
  TradelockerAccountInformation copyWith({
    String? id,
    String? currency,
    String? name,
    _i2.RiskRules? riskRules,
    String? status,
    _i2.TradingRules? tradingRules,
    String? type,
  }) {
    return TradelockerAccountInformation(
      id: id ?? this.id,
      currency: currency ?? this.currency,
      name: name ?? this.name,
      riskRules: riskRules ?? this.riskRules.copyWith(),
      status: status ?? this.status,
      tradingRules: tradingRules ?? this.tradingRules.copyWith(),
      type: type ?? this.type,
    );
  }
}
