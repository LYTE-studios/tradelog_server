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

abstract class LinkedAccount
    implements _i1.TableRow, _i1.ProtocolSerialization {
  LinkedAccount._({
    this.id,
    this.name,
    required this.userInfoId,
    required this.platform,
    required this.accountInformation,
  });

  factory LinkedAccount({
    int? id,
    String? name,
    required int userInfoId,
    required _i2.Platform platform,
    required Map<String, String> accountInformation,
  }) = _LinkedAccountImpl;

  factory LinkedAccount.fromJson(Map<String, dynamic> jsonSerialization) {
    return LinkedAccount(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      platform: _i2.Platform.fromJson((jsonSerialization['platform'] as int)),
      accountInformation: (jsonSerialization['accountInformation'] as Map)
          .map((k, v) => MapEntry(
                k as String,
                v as String,
              )),
    );
  }

  static final t = LinkedAccountTable();

  static const db = LinkedAccountRepository._();

  @override
  int? id;

  String? name;

  int userInfoId;

  _i2.Platform platform;

  Map<String, String> accountInformation;

  @override
  _i1.Table get table => t;

  LinkedAccount copyWith({
    int? id,
    String? name,
    int? userInfoId,
    _i2.Platform? platform,
    Map<String, String>? accountInformation,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      'userInfoId': userInfoId,
      'platform': platform.toJson(),
      'accountInformation': accountInformation.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      'userInfoId': userInfoId,
      'platform': platform.toJson(),
      'accountInformation': accountInformation.toJson(),
    };
  }

  static LinkedAccountInclude include() {
    return LinkedAccountInclude._();
  }

  static LinkedAccountIncludeList includeList({
    _i1.WhereExpressionBuilder<LinkedAccountTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LinkedAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LinkedAccountTable>? orderByList,
    LinkedAccountInclude? include,
  }) {
    return LinkedAccountIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LinkedAccount.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LinkedAccount.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LinkedAccountImpl extends LinkedAccount {
  _LinkedAccountImpl({
    int? id,
    String? name,
    required int userInfoId,
    required _i2.Platform platform,
    required Map<String, String> accountInformation,
  }) : super._(
          id: id,
          name: name,
          userInfoId: userInfoId,
          platform: platform,
          accountInformation: accountInformation,
        );

  @override
  LinkedAccount copyWith({
    Object? id = _Undefined,
    Object? name = _Undefined,
    int? userInfoId,
    _i2.Platform? platform,
    Map<String, String>? accountInformation,
  }) {
    return LinkedAccount(
      id: id is int? ? id : this.id,
      name: name is String? ? name : this.name,
      userInfoId: userInfoId ?? this.userInfoId,
      platform: platform ?? this.platform,
      accountInformation: accountInformation ??
          this.accountInformation.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}

class LinkedAccountTable extends _i1.Table {
  LinkedAccountTable({super.tableRelation})
      : super(tableName: 'linked_account') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byIndex,
    );
    accountInformation = _i1.ColumnSerializable(
      'accountInformation',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt userInfoId;

  late final _i1.ColumnEnum<_i2.Platform> platform;

  late final _i1.ColumnSerializable accountInformation;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        userInfoId,
        platform,
        accountInformation,
      ];
}

class LinkedAccountInclude extends _i1.IncludeObject {
  LinkedAccountInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => LinkedAccount.t;
}

class LinkedAccountIncludeList extends _i1.IncludeList {
  LinkedAccountIncludeList._({
    _i1.WhereExpressionBuilder<LinkedAccountTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LinkedAccount.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => LinkedAccount.t;
}

class LinkedAccountRepository {
  const LinkedAccountRepository._();

  Future<List<LinkedAccount>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LinkedAccountTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LinkedAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LinkedAccountTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LinkedAccount>(
      where: where?.call(LinkedAccount.t),
      orderBy: orderBy?.call(LinkedAccount.t),
      orderByList: orderByList?.call(LinkedAccount.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<LinkedAccount?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LinkedAccountTable>? where,
    int? offset,
    _i1.OrderByBuilder<LinkedAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LinkedAccountTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LinkedAccount>(
      where: where?.call(LinkedAccount.t),
      orderBy: orderBy?.call(LinkedAccount.t),
      orderByList: orderByList?.call(LinkedAccount.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<LinkedAccount?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LinkedAccount>(
      id,
      transaction: transaction,
    );
  }

  Future<List<LinkedAccount>> insert(
    _i1.Session session,
    List<LinkedAccount> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LinkedAccount>(
      rows,
      transaction: transaction,
    );
  }

  Future<LinkedAccount> insertRow(
    _i1.Session session,
    LinkedAccount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LinkedAccount>(
      row,
      transaction: transaction,
    );
  }

  Future<List<LinkedAccount>> update(
    _i1.Session session,
    List<LinkedAccount> rows, {
    _i1.ColumnSelections<LinkedAccountTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LinkedAccount>(
      rows,
      columns: columns?.call(LinkedAccount.t),
      transaction: transaction,
    );
  }

  Future<LinkedAccount> updateRow(
    _i1.Session session,
    LinkedAccount row, {
    _i1.ColumnSelections<LinkedAccountTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LinkedAccount>(
      row,
      columns: columns?.call(LinkedAccount.t),
      transaction: transaction,
    );
  }

  Future<List<LinkedAccount>> delete(
    _i1.Session session,
    List<LinkedAccount> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LinkedAccount>(
      rows,
      transaction: transaction,
    );
  }

  Future<LinkedAccount> deleteRow(
    _i1.Session session,
    LinkedAccount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LinkedAccount>(
      row,
      transaction: transaction,
    );
  }

  Future<List<LinkedAccount>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LinkedAccountTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LinkedAccount>(
      where: where(LinkedAccount.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LinkedAccountTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LinkedAccount>(
      where: where?.call(LinkedAccount.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
