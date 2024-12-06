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

abstract class MetaTradingAccountInformation
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MetaTradingAccountInformation._({
    required this.platform,
    required this.broker,
    required this.currency,
    required this.server,
    required this.balance,
    required this.equity,
    required this.margin,
    required this.freeMargin,
    required this.leverage,
    this.marginLevel,
    required this.tradeAllowed,
    this.investorMode,
    required this.marginMode,
    required this.name,
    required this.login,
    required this.credit,
    this.accountCurrencyExchangeRate,
    required this.type,
  });

  factory MetaTradingAccountInformation({
    required String platform,
    required String broker,
    required String currency,
    required String server,
    required double balance,
    required double equity,
    required double margin,
    required double freeMargin,
    required double leverage,
    double? marginLevel,
    required bool tradeAllowed,
    bool? investorMode,
    required String marginMode,
    required String name,
    required double login,
    required double credit,
    double? accountCurrencyExchangeRate,
    required String type,
  }) = _MetaTradingAccountInformationImpl;

  factory MetaTradingAccountInformation.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return MetaTradingAccountInformation(
      platform: jsonSerialization['platform'] as String,
      broker: jsonSerialization['broker'] as String,
      currency: jsonSerialization['currency'] as String,
      server: jsonSerialization['server'] as String,
      balance: (jsonSerialization['balance'] as num).toDouble(),
      equity: (jsonSerialization['equity'] as num).toDouble(),
      margin: (jsonSerialization['margin'] as num).toDouble(),
      freeMargin: (jsonSerialization['freeMargin'] as num).toDouble(),
      leverage: (jsonSerialization['leverage'] as num).toDouble(),
      marginLevel: (jsonSerialization['marginLevel'] as num?)?.toDouble(),
      tradeAllowed: jsonSerialization['tradeAllowed'] as bool,
      investorMode: jsonSerialization['investorMode'] as bool?,
      marginMode: jsonSerialization['marginMode'] as String,
      name: jsonSerialization['name'] as String,
      login: (jsonSerialization['login'] as num).toDouble(),
      credit: (jsonSerialization['credit'] as num).toDouble(),
      accountCurrencyExchangeRate:
          (jsonSerialization['accountCurrencyExchangeRate'] as num?)
              ?.toDouble(),
      type: jsonSerialization['type'] as String,
    );
  }

  String platform;

  String broker;

  String currency;

  String server;

  double balance;

  double equity;

  double margin;

  double freeMargin;

  double leverage;

  double? marginLevel;

  bool tradeAllowed;

  bool? investorMode;

  String marginMode;

  String name;

  double login;

  double credit;

  double? accountCurrencyExchangeRate;

  String type;

  MetaTradingAccountInformation copyWith({
    String? platform,
    String? broker,
    String? currency,
    String? server,
    double? balance,
    double? equity,
    double? margin,
    double? freeMargin,
    double? leverage,
    double? marginLevel,
    bool? tradeAllowed,
    bool? investorMode,
    String? marginMode,
    String? name,
    double? login,
    double? credit,
    double? accountCurrencyExchangeRate,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'broker': broker,
      'currency': currency,
      'server': server,
      'balance': balance,
      'equity': equity,
      'margin': margin,
      'freeMargin': freeMargin,
      'leverage': leverage,
      if (marginLevel != null) 'marginLevel': marginLevel,
      'tradeAllowed': tradeAllowed,
      if (investorMode != null) 'investorMode': investorMode,
      'marginMode': marginMode,
      'name': name,
      'login': login,
      'credit': credit,
      if (accountCurrencyExchangeRate != null)
        'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
      'type': type,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'platform': platform,
      'broker': broker,
      'currency': currency,
      'server': server,
      'balance': balance,
      'equity': equity,
      'margin': margin,
      'freeMargin': freeMargin,
      'leverage': leverage,
      if (marginLevel != null) 'marginLevel': marginLevel,
      'tradeAllowed': tradeAllowed,
      if (investorMode != null) 'investorMode': investorMode,
      'marginMode': marginMode,
      'name': name,
      'login': login,
      'credit': credit,
      if (accountCurrencyExchangeRate != null)
        'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
      'type': type,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MetaTradingAccountInformationImpl extends MetaTradingAccountInformation {
  _MetaTradingAccountInformationImpl({
    required String platform,
    required String broker,
    required String currency,
    required String server,
    required double balance,
    required double equity,
    required double margin,
    required double freeMargin,
    required double leverage,
    double? marginLevel,
    required bool tradeAllowed,
    bool? investorMode,
    required String marginMode,
    required String name,
    required double login,
    required double credit,
    double? accountCurrencyExchangeRate,
    required String type,
  }) : super._(
          platform: platform,
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
          investorMode: investorMode,
          marginMode: marginMode,
          name: name,
          login: login,
          credit: credit,
          accountCurrencyExchangeRate: accountCurrencyExchangeRate,
          type: type,
        );

  @override
  MetaTradingAccountInformation copyWith({
    String? platform,
    String? broker,
    String? currency,
    String? server,
    double? balance,
    double? equity,
    double? margin,
    double? freeMargin,
    double? leverage,
    Object? marginLevel = _Undefined,
    bool? tradeAllowed,
    Object? investorMode = _Undefined,
    String? marginMode,
    String? name,
    double? login,
    double? credit,
    Object? accountCurrencyExchangeRate = _Undefined,
    String? type,
  }) {
    return MetaTradingAccountInformation(
      platform: platform ?? this.platform,
      broker: broker ?? this.broker,
      currency: currency ?? this.currency,
      server: server ?? this.server,
      balance: balance ?? this.balance,
      equity: equity ?? this.equity,
      margin: margin ?? this.margin,
      freeMargin: freeMargin ?? this.freeMargin,
      leverage: leverage ?? this.leverage,
      marginLevel: marginLevel is double? ? marginLevel : this.marginLevel,
      tradeAllowed: tradeAllowed ?? this.tradeAllowed,
      investorMode: investorMode is bool? ? investorMode : this.investorMode,
      marginMode: marginMode ?? this.marginMode,
      name: name ?? this.name,
      login: login ?? this.login,
      credit: credit ?? this.credit,
      accountCurrencyExchangeRate: accountCurrencyExchangeRate is double?
          ? accountCurrencyExchangeRate
          : this.accountCurrencyExchangeRate,
      type: type ?? this.type,
    );
  }
}
