/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class LinkedAccount extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  LinkedAccount._({
    int? id,
    required this.userInfoId,
    required this.apiKey,
    required this.platform,
  }) : super(id);

  factory LinkedAccount({
    int? id,
    required int userInfoId,
    required String apiKey,
    required _i2.Platform platform,
  }) = _LinkedAccountImpl;

  factory LinkedAccount.fromJson(Map<String, dynamic> jsonSerialization) {
    return LinkedAccount(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      apiKey: jsonSerialization['apiKey'] as String,
      platform: _i2.Platform.fromJson((jsonSerialization['platform'] as int)),
    );
  }

  static final t = LinkedAccountTable();

  static const db = LinkedAccountRepository._();

  int userInfoId;

  String apiKey;

  _i2.Platform platform;

  @override
  _i1.Table get table => t;

  LinkedAccount copyWith({
    int? id,
    int? userInfoId,
    String? apiKey,
    _i2.Platform? platform,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'apiKey': apiKey,
      'platform': platform.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'apiKey': apiKey,
      'platform': platform.toJson(),
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
    required int userInfoId,
    required String apiKey,
    required _i2.Platform platform,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          apiKey: apiKey,
          platform: platform,
        );

  @override
  LinkedAccount copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    String? apiKey,
    _i2.Platform? platform,
  }) {
    return LinkedAccount(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      apiKey: apiKey ?? this.apiKey,
      platform: platform ?? this.platform,
    );
  }
}

class LinkedAccountTable extends _i1.Table {
  LinkedAccountTable({super.tableRelation})
      : super(tableName: 'linked_account') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    apiKey = _i1.ColumnString(
      'apiKey',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byIndex,
    );
  }

  late final _i1.ColumnInt userInfoId;

  late final _i1.ColumnString apiKey;

  late final _i1.ColumnEnum<_i2.Platform> platform;

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        apiKey,
        platform,
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
