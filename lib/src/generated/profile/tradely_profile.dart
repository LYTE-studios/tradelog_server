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

abstract class TradelyProfile
    implements _i1.TableRow, _i1.ProtocolSerialization {
  TradelyProfile._({
    this.id,
    required this.userInfoId,
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
  });

  factory TradelyProfile({
    int? id,
    required int userInfoId,
    required String firstName,
    required String lastName,
    DateTime? dateOfBirth,
  }) = _TradelyProfileImpl;

  factory TradelyProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return TradelyProfile(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      dateOfBirth: jsonSerialization['dateOfBirth'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateOfBirth']),
    );
  }

  static final t = TradelyProfileTable();

  static const db = TradelyProfileRepository._();

  @override
  int? id;

  int userInfoId;

  String firstName;

  String lastName;

  DateTime? dateOfBirth;

  @override
  _i1.Table get table => t;

  TradelyProfile copyWith({
    int? id,
    int? userInfoId,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'firstName': firstName,
      'lastName': lastName,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'firstName': firstName,
      'lastName': lastName,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth?.toJson(),
    };
  }

  static TradelyProfileInclude include() {
    return TradelyProfileInclude._();
  }

  static TradelyProfileIncludeList includeList({
    _i1.WhereExpressionBuilder<TradelyProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TradelyProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradelyProfileTable>? orderByList,
    TradelyProfileInclude? include,
  }) {
    return TradelyProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TradelyProfile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TradelyProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TradelyProfileImpl extends TradelyProfile {
  _TradelyProfileImpl({
    int? id,
    required int userInfoId,
    required String firstName,
    required String lastName,
    DateTime? dateOfBirth,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          firstName: firstName,
          lastName: lastName,
          dateOfBirth: dateOfBirth,
        );

  @override
  TradelyProfile copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    String? firstName,
    String? lastName,
    Object? dateOfBirth = _Undefined,
  }) {
    return TradelyProfile(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth is DateTime? ? dateOfBirth : this.dateOfBirth,
    );
  }
}

class TradelyProfileTable extends _i1.Table {
  TradelyProfileTable({super.tableRelation})
      : super(tableName: 'tradely_profile') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    dateOfBirth = _i1.ColumnDateTime(
      'dateOfBirth',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnDateTime dateOfBirth;

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        firstName,
        lastName,
        dateOfBirth,
      ];
}

class TradelyProfileInclude extends _i1.IncludeObject {
  TradelyProfileInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => TradelyProfile.t;
}

class TradelyProfileIncludeList extends _i1.IncludeList {
  TradelyProfileIncludeList._({
    _i1.WhereExpressionBuilder<TradelyProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TradelyProfile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TradelyProfile.t;
}

class TradelyProfileRepository {
  const TradelyProfileRepository._();

  Future<List<TradelyProfile>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradelyProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TradelyProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradelyProfileTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<TradelyProfile>(
      where: where?.call(TradelyProfile.t),
      orderBy: orderBy?.call(TradelyProfile.t),
      orderByList: orderByList?.call(TradelyProfile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TradelyProfile?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradelyProfileTable>? where,
    int? offset,
    _i1.OrderByBuilder<TradelyProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradelyProfileTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<TradelyProfile>(
      where: where?.call(TradelyProfile.t),
      orderBy: orderBy?.call(TradelyProfile.t),
      orderByList: orderByList?.call(TradelyProfile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TradelyProfile?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<TradelyProfile>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TradelyProfile>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<TradelyProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<TradelyProfile>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TradelyProfile> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    TradelyProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<TradelyProfile>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TradelyProfile>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<TradelyProfile> rows, {
    _i1.ColumnSelections<TradelyProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<TradelyProfile>(
      rows,
      columns: columns?.call(TradelyProfile.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TradelyProfile> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    TradelyProfile row, {
    _i1.ColumnSelections<TradelyProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<TradelyProfile>(
      row,
      columns: columns?.call(TradelyProfile.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TradelyProfile>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<TradelyProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<TradelyProfile>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TradelyProfile> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    TradelyProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<TradelyProfile>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TradelyProfile>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<TradelyProfileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<TradelyProfile>(
      where: where(TradelyProfile.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradelyProfileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<TradelyProfile>(
      where: where?.call(TradelyProfile.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
