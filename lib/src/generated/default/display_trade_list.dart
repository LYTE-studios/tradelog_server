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

abstract class DisplayTradeList
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DisplayTradeList._({required this.trades});

  factory DisplayTradeList({required List<_i2.DisplayTrade> trades}) =
      _DisplayTradeListImpl;

  factory DisplayTradeList.fromJson(Map<String, dynamic> jsonSerialization) {
    return DisplayTradeList(
        trades: (jsonSerialization['trades'] as List)
            .map((e) => _i2.DisplayTrade.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.DisplayTrade> trades;

  DisplayTradeList copyWith({List<_i2.DisplayTrade>? trades});
  @override
  Map<String, dynamic> toJson() {
    return {'trades': trades.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'trades': trades.toJson(valueToJson: (v) => v.toJsonForProtocol())};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DisplayTradeListImpl extends DisplayTradeList {
  _DisplayTradeListImpl({required List<_i2.DisplayTrade> trades})
      : super._(trades: trades);

  @override
  DisplayTradeList copyWith({List<_i2.DisplayTrade>? trades}) {
    return DisplayTradeList(
        trades: trades ?? this.trades.map((e0) => e0.copyWith()).toList());
  }
}
