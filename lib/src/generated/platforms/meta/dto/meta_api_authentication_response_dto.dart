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

abstract class MetaApiAuthenticationResponseDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MetaApiAuthenticationResponseDto._({
    required this.id,
    required this.state,
  });

  factory MetaApiAuthenticationResponseDto({
    required String id,
    required String state,
  }) = _MetaApiAuthenticationResponseDtoImpl;

  factory MetaApiAuthenticationResponseDto.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return MetaApiAuthenticationResponseDto(
      id: jsonSerialization['id'] as String,
      state: jsonSerialization['state'] as String,
    );
  }

  String id;

  String state;

  MetaApiAuthenticationResponseDto copyWith({
    String? id,
    String? state,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'state': state,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'state': state,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MetaApiAuthenticationResponseDtoImpl
    extends MetaApiAuthenticationResponseDto {
  _MetaApiAuthenticationResponseDtoImpl({
    required String id,
    required String state,
  }) : super._(
          id: id,
          state: state,
        );

  @override
  MetaApiAuthenticationResponseDto copyWith({
    String? id,
    String? state,
  }) {
    return MetaApiAuthenticationResponseDto(
      id: id ?? this.id,
      state: state ?? this.state,
    );
  }
}
