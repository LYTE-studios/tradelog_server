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
import '../../core/models/platform.dart' as _i2;

abstract class LinkedAccountDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LinkedAccountDto._({
    this.linkedAccountId,
    this.platform,
    this.title,
    this.status,
    this.currency,
    this.balance,
  });

  factory LinkedAccountDto({
    int? linkedAccountId,
    _i2.Platform? platform,
    String? title,
    List<String>? status,
    List<String>? currency,
    List<double>? balance,
  }) = _LinkedAccountDtoImpl;

  factory LinkedAccountDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return LinkedAccountDto(
      linkedAccountId: jsonSerialization['linkedAccountId'] as int?,
      platform: jsonSerialization['platform'] == null
          ? null
          : _i2.Platform.fromJson((jsonSerialization['platform'] as int)),
      title: jsonSerialization['title'] as String?,
      status: (jsonSerialization['status'] as List?)
          ?.map((e) => e as String)
          .toList(),
      currency: (jsonSerialization['currency'] as List?)
          ?.map((e) => e as String)
          .toList(),
      balance: (jsonSerialization['balance'] as List?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );
  }

  int? linkedAccountId;

  _i2.Platform? platform;

  String? title;

  List<String>? status;

  List<String>? currency;

  List<double>? balance;

  LinkedAccountDto copyWith({
    int? linkedAccountId,
    _i2.Platform? platform,
    String? title,
    List<String>? status,
    List<String>? currency,
    List<double>? balance,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (linkedAccountId != null) 'linkedAccountId': linkedAccountId,
      if (platform != null) 'platform': platform?.toJson(),
      if (title != null) 'title': title,
      if (status != null) 'status': status?.toJson(),
      if (currency != null) 'currency': currency?.toJson(),
      if (balance != null) 'balance': balance?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (linkedAccountId != null) 'linkedAccountId': linkedAccountId,
      if (platform != null) 'platform': platform?.toJson(),
      if (title != null) 'title': title,
      if (status != null) 'status': status?.toJson(),
      if (currency != null) 'currency': currency?.toJson(),
      if (balance != null) 'balance': balance?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LinkedAccountDtoImpl extends LinkedAccountDto {
  _LinkedAccountDtoImpl({
    int? linkedAccountId,
    _i2.Platform? platform,
    String? title,
    List<String>? status,
    List<String>? currency,
    List<double>? balance,
  }) : super._(
          linkedAccountId: linkedAccountId,
          platform: platform,
          title: title,
          status: status,
          currency: currency,
          balance: balance,
        );

  @override
  LinkedAccountDto copyWith({
    Object? linkedAccountId = _Undefined,
    Object? platform = _Undefined,
    Object? title = _Undefined,
    Object? status = _Undefined,
    Object? currency = _Undefined,
    Object? balance = _Undefined,
  }) {
    return LinkedAccountDto(
      linkedAccountId:
          linkedAccountId is int? ? linkedAccountId : this.linkedAccountId,
      platform: platform is _i2.Platform? ? platform : this.platform,
      title: title is String? ? title : this.title,
      status: status is List<String>?
          ? status
          : this.status?.map((e0) => e0).toList(),
      currency: currency is List<String>?
          ? currency
          : this.currency?.map((e0) => e0).toList(),
      balance: balance is List<double>?
          ? balance
          : this.balance?.map((e0) => e0).toList(),
    );
  }
}
