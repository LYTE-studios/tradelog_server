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

abstract class TradingRules
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradingRules._({
    required this.supportBrackets,
    required this.supportPartialClosePosition,
    required this.supportSelfTrading,
    required this.supportTradingOutOfTradingHours,
    required this.supportTrailingStop,
  });

  factory TradingRules({
    required bool supportBrackets,
    required bool supportPartialClosePosition,
    required bool supportSelfTrading,
    required bool supportTradingOutOfTradingHours,
    required bool supportTrailingStop,
  }) = _TradingRulesImpl;

  factory TradingRules.fromJson(Map<String, dynamic> jsonSerialization) {
    return TradingRules(
      supportBrackets: jsonSerialization['supportBrackets'] as bool,
      supportPartialClosePosition:
          jsonSerialization['supportPartialClosePosition'] as bool,
      supportSelfTrading: jsonSerialization['supportSelfTrading'] as bool,
      supportTradingOutOfTradingHours:
          jsonSerialization['supportTradingOutOfTradingHours'] as bool,
      supportTrailingStop: jsonSerialization['supportTrailingStop'] as bool,
    );
  }

  bool supportBrackets;

  bool supportPartialClosePosition;

  bool supportSelfTrading;

  bool supportTradingOutOfTradingHours;

  bool supportTrailingStop;

  TradingRules copyWith({
    bool? supportBrackets,
    bool? supportPartialClosePosition,
    bool? supportSelfTrading,
    bool? supportTradingOutOfTradingHours,
    bool? supportTrailingStop,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'supportBrackets': supportBrackets,
      'supportPartialClosePosition': supportPartialClosePosition,
      'supportSelfTrading': supportSelfTrading,
      'supportTradingOutOfTradingHours': supportTradingOutOfTradingHours,
      'supportTrailingStop': supportTrailingStop,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'supportBrackets': supportBrackets,
      'supportPartialClosePosition': supportPartialClosePosition,
      'supportSelfTrading': supportSelfTrading,
      'supportTradingOutOfTradingHours': supportTradingOutOfTradingHours,
      'supportTrailingStop': supportTrailingStop,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TradingRulesImpl extends TradingRules {
  _TradingRulesImpl({
    required bool supportBrackets,
    required bool supportPartialClosePosition,
    required bool supportSelfTrading,
    required bool supportTradingOutOfTradingHours,
    required bool supportTrailingStop,
  }) : super._(
          supportBrackets: supportBrackets,
          supportPartialClosePosition: supportPartialClosePosition,
          supportSelfTrading: supportSelfTrading,
          supportTradingOutOfTradingHours: supportTradingOutOfTradingHours,
          supportTrailingStop: supportTrailingStop,
        );

  @override
  TradingRules copyWith({
    bool? supportBrackets,
    bool? supportPartialClosePosition,
    bool? supportSelfTrading,
    bool? supportTradingOutOfTradingHours,
    bool? supportTrailingStop,
  }) {
    return TradingRules(
      supportBrackets: supportBrackets ?? this.supportBrackets,
      supportPartialClosePosition:
          supportPartialClosePosition ?? this.supportPartialClosePosition,
      supportSelfTrading: supportSelfTrading ?? this.supportSelfTrading,
      supportTradingOutOfTradingHours: supportTradingOutOfTradingHours ??
          this.supportTradingOutOfTradingHours,
      supportTrailingStop: supportTrailingStop ?? this.supportTrailingStop,
    );
  }
}
