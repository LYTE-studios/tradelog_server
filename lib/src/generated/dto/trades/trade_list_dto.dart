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
import '../../protocol.dart' as _i2;

abstract class TradeListDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradeListDto._({required this.trades});

  factory TradeListDto({required List<_i2.TradeDto> trades}) =
      _TradeListDtoImpl;

  factory TradeListDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TradeListDto(
        trades: (jsonSerialization['trades'] as List)
            .map((e) => _i2.TradeDto.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.TradeDto> trades;

  TradeListDto copyWith({List<_i2.TradeDto>? trades});
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

class _TradeListDtoImpl extends TradeListDto {
  _TradeListDtoImpl({required List<_i2.TradeDto> trades})
      : super._(trades: trades);

  @override
  TradeListDto copyWith({List<_i2.TradeDto>? trades}) {
    return TradeListDto(
        trades: trades ?? this.trades.map((e0) => e0.copyWith()).toList());
  }
}
