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

abstract class AccessToken
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AccessToken._({required this.token});

  factory AccessToken({required String token}) = _AccessTokenImpl;

  factory AccessToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return AccessToken(token: jsonSerialization['token'] as String);
  }

  String token;

  AccessToken copyWith({String? token});
  @override
  Map<String, dynamic> toJson() {
    return {'token': token};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'token': token};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AccessTokenImpl extends AccessToken {
  _AccessTokenImpl({required String token}) : super._(token: token);

  @override
  AccessToken copyWith({String? token}) {
    return AccessToken(token: token ?? this.token);
  }
}
