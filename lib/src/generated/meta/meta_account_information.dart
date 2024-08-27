/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class MetaTradingAccountInformation
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MetaTradingAccountInformation._({
    required this.broker,
    required this.currency,
    required this.server,
    required this.balance,
    required this.equity,
    required this.margin,
    required this.freeMargin,
    required this.leverage,
    required this.marginLevel,
    required this.tradeAllowed,
    required this.marginMode,
    required this.name,
    required this.login,
    required this.credit,
    required this.accountCurrencyExchangeRate,
    required this.type,
  });

  factory MetaTradingAccountInformation({
    required String broker,
    required String currency,
    required String server,
    required double balance,
    required double equity,
    required double margin,
    required double freeMargin,
    required int leverage,
    required double marginLevel,
    required bool tradeAllowed,
    required String marginMode,
    required String name,
    required int login,
    required double credit,
    required double accountCurrencyExchangeRate,
    required String type,
  }) = _MetaTradingAccountInformationImpl;

  factory MetaTradingAccountInformation.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return MetaTradingAccountInformation(
      broker: jsonSerialization['broker'] as String,
      currency: jsonSerialization['currency'] as String,
      server: jsonSerialization['server'] as String,
      balance: (jsonSerialization['balance'] as num).toDouble(),
      equity: (jsonSerialization['equity'] as num).toDouble(),
      margin: (jsonSerialization['margin'] as num).toDouble(),
      freeMargin: (jsonSerialization['freeMargin'] as num).toDouble(),
      leverage: jsonSerialization['leverage'] as int,
      marginLevel: (jsonSerialization['marginLevel'] as num).toDouble(),
      tradeAllowed: jsonSerialization['tradeAllowed'] as bool,
      marginMode: jsonSerialization['marginMode'] as String,
      name: jsonSerialization['name'] as String,
      login: jsonSerialization['login'] as int,
      credit: (jsonSerialization['credit'] as num).toDouble(),
      accountCurrencyExchangeRate:
          (jsonSerialization['accountCurrencyExchangeRate'] as num).toDouble(),
      type: jsonSerialization['type'] as String,
    );
  }

  String broker;

  String currency;

  String server;

  double balance;

  double equity;

  double margin;

  double freeMargin;

  int leverage;

  double marginLevel;

  bool tradeAllowed;

  String marginMode;

  String name;

  int login;

  double credit;

  double accountCurrencyExchangeRate;

  String type;

  MetaTradingAccountInformation copyWith({
    String? broker,
    String? currency,
    String? server,
    double? balance,
    double? equity,
    double? margin,
    double? freeMargin,
    int? leverage,
    double? marginLevel,
    bool? tradeAllowed,
    String? marginMode,
    String? name,
    int? login,
    double? credit,
    double? accountCurrencyExchangeRate,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'broker': broker,
      'currency': currency,
      'server': server,
      'balance': balance,
      'equity': equity,
      'margin': margin,
      'freeMargin': freeMargin,
      'leverage': leverage,
      'marginLevel': marginLevel,
      'tradeAllowed': tradeAllowed,
      'marginMode': marginMode,
      'name': name,
      'login': login,
      'credit': credit,
      'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
      'type': type,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'broker': broker,
      'currency': currency,
      'server': server,
      'balance': balance,
      'equity': equity,
      'margin': margin,
      'freeMargin': freeMargin,
      'leverage': leverage,
      'marginLevel': marginLevel,
      'tradeAllowed': tradeAllowed,
      'marginMode': marginMode,
      'name': name,
      'login': login,
      'credit': credit,
      'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
      'type': type,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MetaTradingAccountInformationImpl extends MetaTradingAccountInformation {
  _MetaTradingAccountInformationImpl({
    required String broker,
    required String currency,
    required String server,
    required double balance,
    required double equity,
    required double margin,
    required double freeMargin,
    required int leverage,
    required double marginLevel,
    required bool tradeAllowed,
    required String marginMode,
    required String name,
    required int login,
    required double credit,
    required double accountCurrencyExchangeRate,
    required String type,
  }) : super._(
          broker: broker,
          currency: currency,
          server: server,
          balance: balance,
          equity: equity,
          margin: margin,
          freeMargin: freeMargin,
          leverage: leverage,
          marginLevel: marginLevel,
          tradeAllowed: tradeAllowed,
          marginMode: marginMode,
          name: name,
          login: login,
          credit: credit,
          accountCurrencyExchangeRate: accountCurrencyExchangeRate,
          type: type,
        );

  @override
  MetaTradingAccountInformation copyWith({
    String? broker,
    String? currency,
    String? server,
    double? balance,
    double? equity,
    double? margin,
    double? freeMargin,
    int? leverage,
    double? marginLevel,
    bool? tradeAllowed,
    String? marginMode,
    String? name,
    int? login,
    double? credit,
    double? accountCurrencyExchangeRate,
    String? type,
  }) {
    return MetaTradingAccountInformation(
      broker: broker ?? this.broker,
      currency: currency ?? this.currency,
      server: server ?? this.server,
      balance: balance ?? this.balance,
      equity: equity ?? this.equity,
      margin: margin ?? this.margin,
      freeMargin: freeMargin ?? this.freeMargin,
      leverage: leverage ?? this.leverage,
      marginLevel: marginLevel ?? this.marginLevel,
      tradeAllowed: tradeAllowed ?? this.tradeAllowed,
      marginMode: marginMode ?? this.marginMode,
      name: name ?? this.name,
      login: login ?? this.login,
      credit: credit ?? this.credit,
      accountCurrencyExchangeRate:
          accountCurrencyExchangeRate ?? this.accountCurrencyExchangeRate,
      type: type ?? this.type,
    );
  }
}
