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

abstract class TradelockerInstrument
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradelockerInstrument._({
    required this.tradableInstrumentId,
    required this.name,
  });

  factory TradelockerInstrument({
    required int tradableInstrumentId,
    required String name,
  }) = _TradelockerInstrumentImpl;

  factory TradelockerInstrument.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return TradelockerInstrument(
      tradableInstrumentId: jsonSerialization['tradableInstrumentId'] as int,
      name: jsonSerialization['name'] as String,
    );
  }

  int tradableInstrumentId;

  String name;

  TradelockerInstrument copyWith({
    int? tradableInstrumentId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'tradableInstrumentId': tradableInstrumentId,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'tradableInstrumentId': tradableInstrumentId,
      'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TradelockerInstrumentImpl extends TradelockerInstrument {
  _TradelockerInstrumentImpl({
    required int tradableInstrumentId,
    required String name,
  }) : super._(
          tradableInstrumentId: tradableInstrumentId,
          name: name,
        );

  @override
  TradelockerInstrument copyWith({
    int? tradableInstrumentId,
    String? name,
  }) {
    return TradelockerInstrument(
      tradableInstrumentId: tradableInstrumentId ?? this.tradableInstrumentId,
      name: name ?? this.name,
    );
  }
}
