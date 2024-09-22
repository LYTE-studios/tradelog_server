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

abstract class TradelockerInstrument
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradelockerInstrument._({
    this.barSource,
    this.baseCurrency,
    this.betSize,
    this.betStep,
    this.bettingCurrency,
    this.contractMonth,
    this.country,
    this.deliveryStatus,
    this.description,
    this.exerciseStyle,
    this.firstTradeDate,
    this.hasDaily,
    this.hasIntraday,
    this.industry,
    this.isin,
    this.lastTradeDate,
    this.localizedName,
    this.logoUrl,
    this.lotSize,
    this.lotStep,
    this.marketCap,
    required this.marketDataExchange,
    this.maxLot,
    this.minLot,
    required this.name,
    this.noticeDate,
    required this.quotingCurrency,
    this.sector,
    this.settlementDate,
    this.settlementSystem,
    this.strikePrice,
    this.strikeType,
    required this.symbolStatus,
    required this.tickCost,
    required this.tickSize,
    this.tradeSessionId,
    this.tradeSessionStatusId,
    required this.tradingExchange,
    required this.type,
  });

  factory TradelockerInstrument({
    String? barSource,
    String? baseCurrency,
    double? betSize,
    double? betStep,
    String? bettingCurrency,
    DateTime? contractMonth,
    int? country,
    String? deliveryStatus,
    String? description,
    String? exerciseStyle,
    DateTime? firstTradeDate,
    bool? hasDaily,
    bool? hasIntraday,
    String? industry,
    String? isin,
    DateTime? lastTradeDate,
    String? localizedName,
    String? logoUrl,
    double? lotSize,
    double? lotStep,
    double? marketCap,
    required String marketDataExchange,
    double? maxLot,
    double? minLot,
    required String name,
    DateTime? noticeDate,
    required String quotingCurrency,
    String? sector,
    DateTime? settlementDate,
    String? settlementSystem,
    double? strikePrice,
    String? strikeType,
    required String symbolStatus,
    required List<_i2.TickCost> tickCost,
    required List<_i2.TickSize> tickSize,
    int? tradeSessionId,
    int? tradeSessionStatusId,
    required String tradingExchange,
    required String type,
  }) = _TradelockerInstrumentImpl;

  factory TradelockerInstrument.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return TradelockerInstrument(
      barSource: jsonSerialization['barSource'] as String?,
      baseCurrency: jsonSerialization['baseCurrency'] as String?,
      betSize: (jsonSerialization['betSize'] as num?)?.toDouble(),
      betStep: (jsonSerialization['betStep'] as num?)?.toDouble(),
      bettingCurrency: jsonSerialization['bettingCurrency'] as String?,
      contractMonth: jsonSerialization['contractMonth'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['contractMonth']),
      country: jsonSerialization['country'] as int?,
      deliveryStatus: jsonSerialization['deliveryStatus'] as String?,
      description: jsonSerialization['description'] as String?,
      exerciseStyle: jsonSerialization['exerciseStyle'] as String?,
      firstTradeDate: jsonSerialization['firstTradeDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['firstTradeDate']),
      hasDaily: jsonSerialization['hasDaily'] as bool?,
      hasIntraday: jsonSerialization['hasIntraday'] as bool?,
      industry: jsonSerialization['industry'] as String?,
      isin: jsonSerialization['isin'] as String?,
      lastTradeDate: jsonSerialization['lastTradeDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastTradeDate']),
      localizedName: jsonSerialization['localizedName'] as String?,
      logoUrl: jsonSerialization['logoUrl'] as String?,
      lotSize: (jsonSerialization['lotSize'] as num?)?.toDouble(),
      lotStep: (jsonSerialization['lotStep'] as num?)?.toDouble(),
      marketCap: (jsonSerialization['marketCap'] as num?)?.toDouble(),
      marketDataExchange: jsonSerialization['marketDataExchange'] as String,
      maxLot: (jsonSerialization['maxLot'] as num?)?.toDouble(),
      minLot: (jsonSerialization['minLot'] as num?)?.toDouble(),
      name: jsonSerialization['name'] as String,
      noticeDate: jsonSerialization['noticeDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['noticeDate']),
      quotingCurrency: jsonSerialization['quotingCurrency'] as String,
      sector: jsonSerialization['sector'] as String?,
      settlementDate: jsonSerialization['settlementDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['settlementDate']),
      settlementSystem: jsonSerialization['settlementSystem'] as String?,
      strikePrice: (jsonSerialization['strikePrice'] as num?)?.toDouble(),
      strikeType: jsonSerialization['strikeType'] as String?,
      symbolStatus: jsonSerialization['symbolStatus'] as String,
      tickCost: (jsonSerialization['tickCost'] as List)
          .map((e) => _i2.TickCost.fromJson((e as Map<String, dynamic>)))
          .toList(),
      tickSize: (jsonSerialization['tickSize'] as List)
          .map((e) => _i2.TickSize.fromJson((e as Map<String, dynamic>)))
          .toList(),
      tradeSessionId: jsonSerialization['tradeSessionId'] as int?,
      tradeSessionStatusId: jsonSerialization['tradeSessionStatusId'] as int?,
      tradingExchange: jsonSerialization['tradingExchange'] as String,
      type: jsonSerialization['type'] as String,
    );
  }

  String? barSource;

  String? baseCurrency;

  double? betSize;

  double? betStep;

  String? bettingCurrency;

  DateTime? contractMonth;

  int? country;

  String? deliveryStatus;

  String? description;

  String? exerciseStyle;

  DateTime? firstTradeDate;

  bool? hasDaily;

  bool? hasIntraday;

  String? industry;

  String? isin;

  DateTime? lastTradeDate;

  String? localizedName;

  String? logoUrl;

  double? lotSize;

  double? lotStep;

  double? marketCap;

  String marketDataExchange;

  double? maxLot;

  double? minLot;

  String name;

  DateTime? noticeDate;

  String quotingCurrency;

  String? sector;

  DateTime? settlementDate;

  String? settlementSystem;

  double? strikePrice;

  String? strikeType;

  String symbolStatus;

  List<_i2.TickCost> tickCost;

  List<_i2.TickSize> tickSize;

  int? tradeSessionId;

  int? tradeSessionStatusId;

  String tradingExchange;

  String type;

  TradelockerInstrument copyWith({
    String? barSource,
    String? baseCurrency,
    double? betSize,
    double? betStep,
    String? bettingCurrency,
    DateTime? contractMonth,
    int? country,
    String? deliveryStatus,
    String? description,
    String? exerciseStyle,
    DateTime? firstTradeDate,
    bool? hasDaily,
    bool? hasIntraday,
    String? industry,
    String? isin,
    DateTime? lastTradeDate,
    String? localizedName,
    String? logoUrl,
    double? lotSize,
    double? lotStep,
    double? marketCap,
    String? marketDataExchange,
    double? maxLot,
    double? minLot,
    String? name,
    DateTime? noticeDate,
    String? quotingCurrency,
    String? sector,
    DateTime? settlementDate,
    String? settlementSystem,
    double? strikePrice,
    String? strikeType,
    String? symbolStatus,
    List<_i2.TickCost>? tickCost,
    List<_i2.TickSize>? tickSize,
    int? tradeSessionId,
    int? tradeSessionStatusId,
    String? tradingExchange,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (barSource != null) 'barSource': barSource,
      if (baseCurrency != null) 'baseCurrency': baseCurrency,
      if (betSize != null) 'betSize': betSize,
      if (betStep != null) 'betStep': betStep,
      if (bettingCurrency != null) 'bettingCurrency': bettingCurrency,
      if (contractMonth != null) 'contractMonth': contractMonth?.toJson(),
      if (country != null) 'country': country,
      if (deliveryStatus != null) 'deliveryStatus': deliveryStatus,
      if (description != null) 'description': description,
      if (exerciseStyle != null) 'exerciseStyle': exerciseStyle,
      if (firstTradeDate != null) 'firstTradeDate': firstTradeDate?.toJson(),
      if (hasDaily != null) 'hasDaily': hasDaily,
      if (hasIntraday != null) 'hasIntraday': hasIntraday,
      if (industry != null) 'industry': industry,
      if (isin != null) 'isin': isin,
      if (lastTradeDate != null) 'lastTradeDate': lastTradeDate?.toJson(),
      if (localizedName != null) 'localizedName': localizedName,
      if (logoUrl != null) 'logoUrl': logoUrl,
      if (lotSize != null) 'lotSize': lotSize,
      if (lotStep != null) 'lotStep': lotStep,
      if (marketCap != null) 'marketCap': marketCap,
      'marketDataExchange': marketDataExchange,
      if (maxLot != null) 'maxLot': maxLot,
      if (minLot != null) 'minLot': minLot,
      'name': name,
      if (noticeDate != null) 'noticeDate': noticeDate?.toJson(),
      'quotingCurrency': quotingCurrency,
      if (sector != null) 'sector': sector,
      if (settlementDate != null) 'settlementDate': settlementDate?.toJson(),
      if (settlementSystem != null) 'settlementSystem': settlementSystem,
      if (strikePrice != null) 'strikePrice': strikePrice,
      if (strikeType != null) 'strikeType': strikeType,
      'symbolStatus': symbolStatus,
      'tickCost': tickCost.toJson(valueToJson: (v) => v.toJson()),
      'tickSize': tickSize.toJson(valueToJson: (v) => v.toJson()),
      if (tradeSessionId != null) 'tradeSessionId': tradeSessionId,
      if (tradeSessionStatusId != null)
        'tradeSessionStatusId': tradeSessionStatusId,
      'tradingExchange': tradingExchange,
      'type': type,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (barSource != null) 'barSource': barSource,
      if (baseCurrency != null) 'baseCurrency': baseCurrency,
      if (betSize != null) 'betSize': betSize,
      if (betStep != null) 'betStep': betStep,
      if (bettingCurrency != null) 'bettingCurrency': bettingCurrency,
      if (contractMonth != null) 'contractMonth': contractMonth?.toJson(),
      if (country != null) 'country': country,
      if (deliveryStatus != null) 'deliveryStatus': deliveryStatus,
      if (description != null) 'description': description,
      if (exerciseStyle != null) 'exerciseStyle': exerciseStyle,
      if (firstTradeDate != null) 'firstTradeDate': firstTradeDate?.toJson(),
      if (hasDaily != null) 'hasDaily': hasDaily,
      if (hasIntraday != null) 'hasIntraday': hasIntraday,
      if (industry != null) 'industry': industry,
      if (isin != null) 'isin': isin,
      if (lastTradeDate != null) 'lastTradeDate': lastTradeDate?.toJson(),
      if (localizedName != null) 'localizedName': localizedName,
      if (logoUrl != null) 'logoUrl': logoUrl,
      if (lotSize != null) 'lotSize': lotSize,
      if (lotStep != null) 'lotStep': lotStep,
      if (marketCap != null) 'marketCap': marketCap,
      'marketDataExchange': marketDataExchange,
      if (maxLot != null) 'maxLot': maxLot,
      if (minLot != null) 'minLot': minLot,
      'name': name,
      if (noticeDate != null) 'noticeDate': noticeDate?.toJson(),
      'quotingCurrency': quotingCurrency,
      if (sector != null) 'sector': sector,
      if (settlementDate != null) 'settlementDate': settlementDate?.toJson(),
      if (settlementSystem != null) 'settlementSystem': settlementSystem,
      if (strikePrice != null) 'strikePrice': strikePrice,
      if (strikeType != null) 'strikeType': strikeType,
      'symbolStatus': symbolStatus,
      'tickCost': tickCost.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'tickSize': tickSize.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (tradeSessionId != null) 'tradeSessionId': tradeSessionId,
      if (tradeSessionStatusId != null)
        'tradeSessionStatusId': tradeSessionStatusId,
      'tradingExchange': tradingExchange,
      'type': type,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TradelockerInstrumentImpl extends TradelockerInstrument {
  _TradelockerInstrumentImpl({
    String? barSource,
    String? baseCurrency,
    double? betSize,
    double? betStep,
    String? bettingCurrency,
    DateTime? contractMonth,
    int? country,
    String? deliveryStatus,
    String? description,
    String? exerciseStyle,
    DateTime? firstTradeDate,
    bool? hasDaily,
    bool? hasIntraday,
    String? industry,
    String? isin,
    DateTime? lastTradeDate,
    String? localizedName,
    String? logoUrl,
    double? lotSize,
    double? lotStep,
    double? marketCap,
    required String marketDataExchange,
    double? maxLot,
    double? minLot,
    required String name,
    DateTime? noticeDate,
    required String quotingCurrency,
    String? sector,
    DateTime? settlementDate,
    String? settlementSystem,
    double? strikePrice,
    String? strikeType,
    required String symbolStatus,
    required List<_i2.TickCost> tickCost,
    required List<_i2.TickSize> tickSize,
    int? tradeSessionId,
    int? tradeSessionStatusId,
    required String tradingExchange,
    required String type,
  }) : super._(
          barSource: barSource,
          baseCurrency: baseCurrency,
          betSize: betSize,
          betStep: betStep,
          bettingCurrency: bettingCurrency,
          contractMonth: contractMonth,
          country: country,
          deliveryStatus: deliveryStatus,
          description: description,
          exerciseStyle: exerciseStyle,
          firstTradeDate: firstTradeDate,
          hasDaily: hasDaily,
          hasIntraday: hasIntraday,
          industry: industry,
          isin: isin,
          lastTradeDate: lastTradeDate,
          localizedName: localizedName,
          logoUrl: logoUrl,
          lotSize: lotSize,
          lotStep: lotStep,
          marketCap: marketCap,
          marketDataExchange: marketDataExchange,
          maxLot: maxLot,
          minLot: minLot,
          name: name,
          noticeDate: noticeDate,
          quotingCurrency: quotingCurrency,
          sector: sector,
          settlementDate: settlementDate,
          settlementSystem: settlementSystem,
          strikePrice: strikePrice,
          strikeType: strikeType,
          symbolStatus: symbolStatus,
          tickCost: tickCost,
          tickSize: tickSize,
          tradeSessionId: tradeSessionId,
          tradeSessionStatusId: tradeSessionStatusId,
          tradingExchange: tradingExchange,
          type: type,
        );

  @override
  TradelockerInstrument copyWith({
    Object? barSource = _Undefined,
    Object? baseCurrency = _Undefined,
    Object? betSize = _Undefined,
    Object? betStep = _Undefined,
    Object? bettingCurrency = _Undefined,
    Object? contractMonth = _Undefined,
    Object? country = _Undefined,
    Object? deliveryStatus = _Undefined,
    Object? description = _Undefined,
    Object? exerciseStyle = _Undefined,
    Object? firstTradeDate = _Undefined,
    Object? hasDaily = _Undefined,
    Object? hasIntraday = _Undefined,
    Object? industry = _Undefined,
    Object? isin = _Undefined,
    Object? lastTradeDate = _Undefined,
    Object? localizedName = _Undefined,
    Object? logoUrl = _Undefined,
    Object? lotSize = _Undefined,
    Object? lotStep = _Undefined,
    Object? marketCap = _Undefined,
    String? marketDataExchange,
    Object? maxLot = _Undefined,
    Object? minLot = _Undefined,
    String? name,
    Object? noticeDate = _Undefined,
    String? quotingCurrency,
    Object? sector = _Undefined,
    Object? settlementDate = _Undefined,
    Object? settlementSystem = _Undefined,
    Object? strikePrice = _Undefined,
    Object? strikeType = _Undefined,
    String? symbolStatus,
    List<_i2.TickCost>? tickCost,
    List<_i2.TickSize>? tickSize,
    Object? tradeSessionId = _Undefined,
    Object? tradeSessionStatusId = _Undefined,
    String? tradingExchange,
    String? type,
  }) {
    return TradelockerInstrument(
      barSource: barSource is String? ? barSource : this.barSource,
      baseCurrency: baseCurrency is String? ? baseCurrency : this.baseCurrency,
      betSize: betSize is double? ? betSize : this.betSize,
      betStep: betStep is double? ? betStep : this.betStep,
      bettingCurrency:
          bettingCurrency is String? ? bettingCurrency : this.bettingCurrency,
      contractMonth:
          contractMonth is DateTime? ? contractMonth : this.contractMonth,
      country: country is int? ? country : this.country,
      deliveryStatus:
          deliveryStatus is String? ? deliveryStatus : this.deliveryStatus,
      description: description is String? ? description : this.description,
      exerciseStyle:
          exerciseStyle is String? ? exerciseStyle : this.exerciseStyle,
      firstTradeDate:
          firstTradeDate is DateTime? ? firstTradeDate : this.firstTradeDate,
      hasDaily: hasDaily is bool? ? hasDaily : this.hasDaily,
      hasIntraday: hasIntraday is bool? ? hasIntraday : this.hasIntraday,
      industry: industry is String? ? industry : this.industry,
      isin: isin is String? ? isin : this.isin,
      lastTradeDate:
          lastTradeDate is DateTime? ? lastTradeDate : this.lastTradeDate,
      localizedName:
          localizedName is String? ? localizedName : this.localizedName,
      logoUrl: logoUrl is String? ? logoUrl : this.logoUrl,
      lotSize: lotSize is double? ? lotSize : this.lotSize,
      lotStep: lotStep is double? ? lotStep : this.lotStep,
      marketCap: marketCap is double? ? marketCap : this.marketCap,
      marketDataExchange: marketDataExchange ?? this.marketDataExchange,
      maxLot: maxLot is double? ? maxLot : this.maxLot,
      minLot: minLot is double? ? minLot : this.minLot,
      name: name ?? this.name,
      noticeDate: noticeDate is DateTime? ? noticeDate : this.noticeDate,
      quotingCurrency: quotingCurrency ?? this.quotingCurrency,
      sector: sector is String? ? sector : this.sector,
      settlementDate:
          settlementDate is DateTime? ? settlementDate : this.settlementDate,
      settlementSystem: settlementSystem is String?
          ? settlementSystem
          : this.settlementSystem,
      strikePrice: strikePrice is double? ? strikePrice : this.strikePrice,
      strikeType: strikeType is String? ? strikeType : this.strikeType,
      symbolStatus: symbolStatus ?? this.symbolStatus,
      tickCost: tickCost ?? this.tickCost.clone(),
      tickSize: tickSize ?? this.tickSize.clone(),
      tradeSessionId:
          tradeSessionId is int? ? tradeSessionId : this.tradeSessionId,
      tradeSessionStatusId: tradeSessionStatusId is int?
          ? tradeSessionStatusId
          : this.tradeSessionStatusId,
      tradingExchange: tradingExchange ?? this.tradingExchange,
      type: type ?? this.type,
    );
  }
}
