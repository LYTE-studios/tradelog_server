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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;

abstract class TradelockerCredentials
    implements _i1.TableRow, _i1.ProtocolSerialization {
  TradelockerCredentials._({
    this.id,
    required this.email,
    required this.password,
    required this.server,
    this.refreshToken,
    required this.userId,
    this.user,
  });

  factory TradelockerCredentials({
    int? id,
    required String email,
    required String password,
    required String server,
    String? refreshToken,
    required int userId,
    _i2.UserInfo? user,
  }) = _TradelockerCredentialsImpl;

  factory TradelockerCredentials.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return TradelockerCredentials(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      server: jsonSerialization['server'] as String,
      refreshToken: jsonSerialization['refreshToken'] as String?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
    );
  }

  static final t = TradelockerCredentialsTable();

  static const db = TradelockerCredentialsRepository._();

  @override
  int? id;

  String email;

  String password;

  String server;

  String? refreshToken;

  int userId;

  _i2.UserInfo? user;

  @override
  _i1.Table get table => t;

  TradelockerCredentials copyWith({
    int? id,
    String? email,
    String? password,
    String? server,
    String? refreshToken,
    int? userId,
    _i2.UserInfo? user,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'password': password,
      'server': server,
      if (refreshToken != null) 'refreshToken': refreshToken,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'password': password,
      'server': server,
      if (refreshToken != null) 'refreshToken': refreshToken,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
    };
  }

  static TradelockerCredentialsInclude include({_i2.UserInfoInclude? user}) {
    return TradelockerCredentialsInclude._(user: user);
  }

  static TradelockerCredentialsIncludeList includeList({
    _i1.WhereExpressionBuilder<TradelockerCredentialsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TradelockerCredentialsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradelockerCredentialsTable>? orderByList,
    TradelockerCredentialsInclude? include,
  }) {
    return TradelockerCredentialsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TradelockerCredentials.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TradelockerCredentials.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TradelockerCredentialsImpl extends TradelockerCredentials {
  _TradelockerCredentialsImpl({
    int? id,
    required String email,
    required String password,
    required String server,
    String? refreshToken,
    required int userId,
    _i2.UserInfo? user,
  }) : super._(
          id: id,
          email: email,
          password: password,
          server: server,
          refreshToken: refreshToken,
          userId: userId,
          user: user,
        );

  @override
  TradelockerCredentials copyWith({
    Object? id = _Undefined,
    String? email,
    String? password,
    String? server,
    Object? refreshToken = _Undefined,
    int? userId,
    Object? user = _Undefined,
  }) {
    return TradelockerCredentials(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      server: server ?? this.server,
      refreshToken: refreshToken is String? ? refreshToken : this.refreshToken,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
    );
  }
}

class TradelockerCredentialsTable extends _i1.Table {
  TradelockerCredentialsTable({super.tableRelation})
      : super(tableName: 'tradelocker_credentials') {
    email = _i1.ColumnString(
      'email',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
    server = _i1.ColumnString(
      'server',
      this,
    );
    refreshToken = _i1.ColumnString(
      'refreshToken',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
  }

  late final _i1.ColumnString email;

  late final _i1.ColumnString password;

  late final _i1.ColumnString server;

  late final _i1.ColumnString refreshToken;

  late final _i1.ColumnInt userId;

  _i2.UserInfoTable? _user;

  _i2.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: TradelockerCredentials.t.userId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        email,
        password,
        server,
        refreshToken,
        userId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class TradelockerCredentialsInclude extends _i1.IncludeObject {
  TradelockerCredentialsInclude._({_i2.UserInfoInclude? user}) {
    _user = user;
  }

  _i2.UserInfoInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table get table => TradelockerCredentials.t;
}

class TradelockerCredentialsIncludeList extends _i1.IncludeList {
  TradelockerCredentialsIncludeList._({
    _i1.WhereExpressionBuilder<TradelockerCredentialsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TradelockerCredentials.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TradelockerCredentials.t;
}

class TradelockerCredentialsRepository {
  const TradelockerCredentialsRepository._();

  final attachRow = const TradelockerCredentialsAttachRowRepository._();

  Future<List<TradelockerCredentials>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradelockerCredentialsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TradelockerCredentialsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradelockerCredentialsTable>? orderByList,
    _i1.Transaction? transaction,
    TradelockerCredentialsInclude? include,
  }) async {
    return databaseAccessor.db.find<TradelockerCredentials>(
      where: where?.call(TradelockerCredentials.t),
      orderBy: orderBy?.call(TradelockerCredentials.t),
      orderByList: orderByList?.call(TradelockerCredentials.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<TradelockerCredentials?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradelockerCredentialsTable>? where,
    int? offset,
    _i1.OrderByBuilder<TradelockerCredentialsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradelockerCredentialsTable>? orderByList,
    _i1.Transaction? transaction,
    TradelockerCredentialsInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<TradelockerCredentials>(
      where: where?.call(TradelockerCredentials.t),
      orderBy: orderBy?.call(TradelockerCredentials.t),
      orderByList: orderByList?.call(TradelockerCredentials.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<TradelockerCredentials?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    TradelockerCredentialsInclude? include,
  }) async {
    return databaseAccessor.db.findById<TradelockerCredentials>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<TradelockerCredentials>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<TradelockerCredentials> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<TradelockerCredentials>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TradelockerCredentials> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    TradelockerCredentials row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<TradelockerCredentials>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TradelockerCredentials>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<TradelockerCredentials> rows, {
    _i1.ColumnSelections<TradelockerCredentialsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<TradelockerCredentials>(
      rows,
      columns: columns?.call(TradelockerCredentials.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TradelockerCredentials> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    TradelockerCredentials row, {
    _i1.ColumnSelections<TradelockerCredentialsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<TradelockerCredentials>(
      row,
      columns: columns?.call(TradelockerCredentials.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TradelockerCredentials>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<TradelockerCredentials> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<TradelockerCredentials>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TradelockerCredentials> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    TradelockerCredentials row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<TradelockerCredentials>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TradelockerCredentials>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<TradelockerCredentialsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<TradelockerCredentials>(
      where: where(TradelockerCredentials.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradelockerCredentialsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<TradelockerCredentials>(
      where: where?.call(TradelockerCredentials.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TradelockerCredentialsAttachRowRepository {
  const TradelockerCredentialsAttachRowRepository._();

  Future<void> user(
    _i1.DatabaseAccessor databaseAccessor,
    TradelockerCredentials tradelockerCredentials,
    _i2.UserInfo user, {
    _i1.Transaction? transaction,
  }) async {
    if (tradelockerCredentials.id == null) {
      throw ArgumentError.notNull('tradelockerCredentials.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $tradelockerCredentials =
        tradelockerCredentials.copyWith(userId: user.id);
    await databaseAccessor.db.updateRow<TradelockerCredentials>(
      $tradelockerCredentials,
      columns: [TradelockerCredentials.t.userId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
