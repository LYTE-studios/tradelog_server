/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class LinkedAccount
    implements _i1.TableRow, _i1.ProtocolSerialization {
  LinkedAccount._({
    this.id,
    required this.userInfoId,
    required this.apiUrl,
    required this.apiKey,
    required this.refreshToken,
    required this.platform,
    this.tradelockerCredentialsId,
    this.tradelockerAccountId,
    this.tradelockerAccounts,
    this.metaID,
    this.title,
  });

  factory LinkedAccount({
    int? id,
    required int userInfoId,
    required String apiUrl,
    required String apiKey,
    required String refreshToken,
    required _i2.Platform platform,
    int? tradelockerCredentialsId,
    List<String>? tradelockerAccountId,
    List<String>? tradelockerAccounts,
    String? metaID,
    String? title,
  }) = _LinkedAccountImpl;

  factory LinkedAccount.fromJson(Map<String, dynamic> jsonSerialization) {
    return LinkedAccount(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      apiUrl: jsonSerialization['apiUrl'] as String,
      apiKey: jsonSerialization['apiKey'] as String,
      refreshToken: jsonSerialization['refreshToken'] as String,
      platform: _i2.Platform.fromJson((jsonSerialization['platform'] as int)),
      tradelockerCredentialsId:
          jsonSerialization['tradelockerCredentialsId'] as int?,
      tradelockerAccountId: (jsonSerialization['tradelockerAccountId'] as List?)
          ?.map((e) => e as String)
          .toList(),
      tradelockerAccounts: (jsonSerialization['tradelockerAccounts'] as List?)
          ?.map((e) => e as String)
          .toList(),
      metaID: jsonSerialization['metaID'] as String?,
      title: jsonSerialization['title'] as String?,
    );
  }

  static final t = LinkedAccountTable();

  static const db = LinkedAccountRepository._();

  @override
  int? id;

  int userInfoId;

  String apiUrl;

  String apiKey;

  String refreshToken;

  _i2.Platform platform;

  int? tradelockerCredentialsId;

  List<String>? tradelockerAccountId;

  List<String>? tradelockerAccounts;

  String? metaID;

  String? title;

  @override
  _i1.Table get table => t;

  LinkedAccount copyWith({
    int? id,
    int? userInfoId,
    String? apiUrl,
    String? apiKey,
    String? refreshToken,
    _i2.Platform? platform,
    int? tradelockerCredentialsId,
    List<String>? tradelockerAccountId,
    List<String>? tradelockerAccounts,
    String? metaID,
    String? title,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'apiUrl': apiUrl,
      'apiKey': apiKey,
      'refreshToken': refreshToken,
      'platform': platform.toJson(),
      if (tradelockerCredentialsId != null)
        'tradelockerCredentialsId': tradelockerCredentialsId,
      if (tradelockerAccountId != null)
        'tradelockerAccountId': tradelockerAccountId?.toJson(),
      if (tradelockerAccounts != null)
        'tradelockerAccounts': tradelockerAccounts?.toJson(),
      if (metaID != null) 'metaID': metaID,
      if (title != null) 'title': title,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'apiUrl': apiUrl,
      'apiKey': apiKey,
      'refreshToken': refreshToken,
      'platform': platform.toJson(),
      if (tradelockerCredentialsId != null)
        'tradelockerCredentialsId': tradelockerCredentialsId,
      if (tradelockerAccountId != null)
        'tradelockerAccountId': tradelockerAccountId?.toJson(),
      if (tradelockerAccounts != null)
        'tradelockerAccounts': tradelockerAccounts?.toJson(),
      if (metaID != null) 'metaID': metaID,
      if (title != null) 'title': title,
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
    required String apiUrl,
    required String apiKey,
    required String refreshToken,
    required _i2.Platform platform,
    int? tradelockerCredentialsId,
    List<String>? tradelockerAccountId,
    List<String>? tradelockerAccounts,
    String? metaID,
    String? title,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          apiUrl: apiUrl,
          apiKey: apiKey,
          refreshToken: refreshToken,
          platform: platform,
          tradelockerCredentialsId: tradelockerCredentialsId,
          tradelockerAccountId: tradelockerAccountId,
          tradelockerAccounts: tradelockerAccounts,
          metaID: metaID,
          title: title,
        );

  @override
  LinkedAccount copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    String? apiUrl,
    String? apiKey,
    String? refreshToken,
    _i2.Platform? platform,
    Object? tradelockerCredentialsId = _Undefined,
    Object? tradelockerAccountId = _Undefined,
    Object? tradelockerAccounts = _Undefined,
    Object? metaID = _Undefined,
    Object? title = _Undefined,
  }) {
    return LinkedAccount(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      apiUrl: apiUrl ?? this.apiUrl,
      apiKey: apiKey ?? this.apiKey,
      refreshToken: refreshToken ?? this.refreshToken,
      platform: platform ?? this.platform,
      tradelockerCredentialsId: tradelockerCredentialsId is int?
          ? tradelockerCredentialsId
          : this.tradelockerCredentialsId,
      tradelockerAccountId: tradelockerAccountId is List<String>?
          ? tradelockerAccountId
          : this.tradelockerAccountId?.map((e0) => e0).toList(),
      tradelockerAccounts: tradelockerAccounts is List<String>?
          ? tradelockerAccounts
          : this.tradelockerAccounts?.map((e0) => e0).toList(),
      metaID: metaID is String? ? metaID : this.metaID,
      title: title is String? ? title : this.title,
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
    apiUrl = _i1.ColumnString(
      'apiUrl',
      this,
    );
    apiKey = _i1.ColumnString(
      'apiKey',
      this,
    );
    refreshToken = _i1.ColumnString(
      'refreshToken',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byIndex,
    );
    tradelockerCredentialsId = _i1.ColumnInt(
      'tradelockerCredentialsId',
      this,
    );
    tradelockerAccountId = _i1.ColumnSerializable(
      'tradelockerAccountId',
      this,
    );
    tradelockerAccounts = _i1.ColumnSerializable(
      'tradelockerAccounts',
      this,
    );
    metaID = _i1.ColumnString(
      'metaID',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  late final _i1.ColumnString apiUrl;

  late final _i1.ColumnString apiKey;

  late final _i1.ColumnString refreshToken;

  late final _i1.ColumnEnum<_i2.Platform> platform;

  late final _i1.ColumnInt tradelockerCredentialsId;

  late final _i1.ColumnSerializable tradelockerAccountId;

  late final _i1.ColumnSerializable tradelockerAccounts;

  late final _i1.ColumnString metaID;

  late final _i1.ColumnString title;

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        apiUrl,
        apiKey,
        refreshToken,
        platform,
        tradelockerCredentialsId,
        tradelockerAccountId,
        tradelockerAccounts,
        metaID,
        title,
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
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
    );
  }

  Future<LinkedAccount?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LinkedAccount>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<LinkedAccount>> insert(
    _i1.Session session,
    List<LinkedAccount> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LinkedAccount>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<LinkedAccount> insertRow(
    _i1.Session session,
    LinkedAccount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LinkedAccount>(
      row,
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<LinkedAccount>> delete(
    _i1.Session session,
    List<LinkedAccount> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LinkedAccount>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<LinkedAccount> deleteRow(
    _i1.Session session,
    LinkedAccount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LinkedAccount>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<LinkedAccount>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LinkedAccountTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LinkedAccount>(
      where: where(LinkedAccount.t),
      transaction: transaction ?? session.transaction,
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
      transaction: transaction ?? session.transaction,
    );
  }
}
