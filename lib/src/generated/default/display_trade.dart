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

abstract class DisplayTrade
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DisplayTrade._({
    required this.openTime,
    required this.symbol,
    required this.direction,
    required this.status,
    required this.netpl,
    required this.netroi,
  });

  factory DisplayTrade({
    required DateTime openTime,
    required String symbol,
    required String direction,
    required String status,
    required double netpl,
    required double netroi,
  }) = _DisplayTradeImpl;

  factory DisplayTrade.fromJson(Map<String, dynamic> jsonSerialization) {
    return DisplayTrade(
      openTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['openTime']),
      symbol: jsonSerialization['symbol'] as String,
      direction: jsonSerialization['direction'] as String,
      status: jsonSerialization['status'] as String,
      netpl: (jsonSerialization['netpl'] as num).toDouble(),
      netroi: (jsonSerialization['netroi'] as num).toDouble(),
    );
  }

  DateTime openTime;

  String symbol;

  String direction;

  String status;

  double netpl;

  double netroi;

  DisplayTrade copyWith({
    DateTime? openTime,
    String? symbol,
    String? direction,
    String? status,
    double? netpl,
    double? netroi,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'openTime': openTime.toJson(),
      'symbol': symbol,
      'direction': direction,
      'status': status,
      'netpl': netpl,
      'netroi': netroi,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'openTime': openTime.toJson(),
      'symbol': symbol,
      'direction': direction,
      'status': status,
      'netpl': netpl,
      'netroi': netroi,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DisplayTradeImpl extends DisplayTrade {
  _DisplayTradeImpl({
    required DateTime openTime,
    required String symbol,
    required String direction,
    required String status,
    required double netpl,
    required double netroi,
  }) : super._(
          openTime: openTime,
          symbol: symbol,
          direction: direction,
          status: status,
          netpl: netpl,
          netroi: netroi,
        );

  @override
  DisplayTrade copyWith({
    DateTime? openTime,
    String? symbol,
    String? direction,
    String? status,
    double? netpl,
    double? netroi,
  }) {
    return DisplayTrade(
      openTime: openTime ?? this.openTime,
      symbol: symbol ?? this.symbol,
      direction: direction ?? this.direction,
      status: status ?? this.status,
      netpl: netpl ?? this.netpl,
      netroi: netroi ?? this.netroi,
    );
  }
}
