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

abstract class Note extends _i1.TableRow implements _i1.ProtocolSerialization {
  Note._({
    int? id,
    required this.content,
    required this.userId,
    this.user,
    required this.date,
  }) : super(id);

  factory Note({
    int? id,
    required String content,
    required int userId,
    _i2.UserInfo? user,
    required DateTime date,
  }) = _NoteImpl;

  factory Note.fromJson(Map<String, dynamic> jsonSerialization) {
    return Note(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
    );
  }

  static final t = NoteTable();

  static const db = NoteRepository._();

  String content;

  int userId;

  _i2.UserInfo? user;

  DateTime date;

  @override
  _i1.Table get table => t;

  Note copyWith({
    int? id,
    String? content,
    int? userId,
    _i2.UserInfo? user,
    DateTime? date,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'date': date.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'date': date.toJson(),
    };
  }

  static NoteInclude include({_i2.UserInfoInclude? user}) {
    return NoteInclude._(user: user);
  }

  static NoteIncludeList includeList({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    NoteInclude? include,
  }) {
    return NoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Note.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Note.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NoteImpl extends Note {
  _NoteImpl({
    int? id,
    required String content,
    required int userId,
    _i2.UserInfo? user,
    required DateTime date,
  }) : super._(
          id: id,
          content: content,
          userId: userId,
          user: user,
          date: date,
        );

  @override
  Note copyWith({
    Object? id = _Undefined,
    String? content,
    int? userId,
    Object? user = _Undefined,
    DateTime? date,
  }) {
    return Note(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      date: date ?? this.date,
    );
  }
}

class NoteTable extends _i1.Table {
  NoteTable({super.tableRelation}) : super(tableName: 'note') {
    content = _i1.ColumnString(
      'content',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
  }

  late final _i1.ColumnString content;

  late final _i1.ColumnInt userId;

  _i2.UserInfoTable? _user;

  late final _i1.ColumnDateTime date;

  _i2.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Note.t.userId,
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
        content,
        userId,
        date,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class NoteInclude extends _i1.IncludeObject {
  NoteInclude._({_i2.UserInfoInclude? user}) {
    _user = user;
  }

  _i2.UserInfoInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table get table => Note.t;
}

class NoteIncludeList extends _i1.IncludeList {
  NoteIncludeList._({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Note.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Note.t;
}

class NoteRepository {
  const NoteRepository._();

  final attachRow = const NoteAttachRowRepository._();

  Future<List<Note>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return databaseAccessor.db.find<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Note?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Note?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return databaseAccessor.db.findById<Note>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<Note>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Note>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Note> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Note>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Note>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Note> rows, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Note>(
      rows,
      columns: columns?.call(Note.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Note> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Note row, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Note>(
      row,
      columns: columns?.call(Note.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Note>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Note>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Note> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Note>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Note>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<NoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Note>(
      where: where(Note.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Note>(
      where: where?.call(Note.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class NoteAttachRowRepository {
  const NoteAttachRowRepository._();

  Future<void> user(
    _i1.DatabaseAccessor databaseAccessor,
    Note note,
    _i2.UserInfo user, {
    _i1.Transaction? transaction,
  }) async {
    if (note.id == null) {
      throw ArgumentError.notNull('note.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $note = note.copyWith(userId: user.id);
    await databaseAccessor.db.updateRow<Note>(
      $note,
      columns: [Note.t.userId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
