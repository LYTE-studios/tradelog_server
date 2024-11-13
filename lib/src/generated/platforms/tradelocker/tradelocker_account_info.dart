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

abstract class TradelockerAccountInformation
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TradelockerAccountInformation._({
    required this.id,
    required this.name,
    required this.currency,
    required this.accNum,
    required this.accountBalance,
  });

  factory TradelockerAccountInformation({
    required String id,
    required String name,
    required String currency,
    required String accNum,
    required String accountBalance,
  }) = _TradelockerAccountInformationImpl;

  factory TradelockerAccountInformation.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return TradelockerAccountInformation(
      id: jsonSerialization['id'] as String,
      name: jsonSerialization['name'] as String,
      currency: jsonSerialization['currency'] as String,
      accNum: jsonSerialization['accNum'] as String,
      accountBalance: jsonSerialization['accountBalance'] as String,
    );
  }

  String id;

  String name;

  String currency;

  String accNum;

  String accountBalance;

  TradelockerAccountInformation copyWith({
    String? id,
    String? name,
    String? currency,
    String? accNum,
    String? accountBalance,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'currency': currency,
      'accNum': accNum,
      'accountBalance': accountBalance,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'name': name,
      'currency': currency,
      'accNum': accNum,
      'accountBalance': accountBalance,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TradelockerAccountInformationImpl extends TradelockerAccountInformation {
  _TradelockerAccountInformationImpl({
    required String id,
    required String name,
    required String currency,
    required String accNum,
    required String accountBalance,
  }) : super._(
          id: id,
          name: name,
          currency: currency,
          accNum: accNum,
          accountBalance: accountBalance,
        );

  @override
  TradelockerAccountInformation copyWith({
    String? id,
    String? name,
    String? currency,
    String? accNum,
    String? accountBalance,
  }) {
    return TradelockerAccountInformation(
      id: id ?? this.id,
      name: name ?? this.name,
      currency: currency ?? this.currency,
      accNum: accNum ?? this.accNum,
      accountBalance: accountBalance ?? this.accountBalance,
    );
  }
}
