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
import '../protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;

abstract class Trade implements _i1.TableRow, _i1.ProtocolSerialization {
  Trade._({
    this.id,
    required this.linkedAccountId,
    this.linkedAccount,
    required this.userId,
    this.user,
    this.realizedPl,
    required this.status,
    required this.symbol,
    required this.option,
    this.feeCurrency,
    this.fee,
    required this.openTime,
    this.closeTime,
    required this.lotSize,
    this.takeProfit,
    this.stopLoss,
  });

  factory Trade({
    int? id,
    required int linkedAccountId,
    _i2.LinkedAccount? linkedAccount,
    required int userId,
    _i3.UserInfo? user,
    double? realizedPl,
    required _i2.TradeStatus status,
    required String symbol,
    required _i2.Option option,
    String? feeCurrency,
    double? fee,
    required DateTime openTime,
    DateTime? closeTime,
    required double lotSize,
    double? takeProfit,
    double? stopLoss,
  }) = _TradeImpl;

  factory Trade.fromJson(Map<String, dynamic> jsonSerialization) {
    return Trade(
      id: jsonSerialization['id'] as int?,
      linkedAccountId: jsonSerialization['linkedAccountId'] as int,
      linkedAccount: jsonSerialization['linkedAccount'] == null
          ? null
          : _i2.LinkedAccount.fromJson(
              (jsonSerialization['linkedAccount'] as Map<String, dynamic>)),
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i3.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      realizedPl: (jsonSerialization['realizedPl'] as num?)?.toDouble(),
      status: _i2.TradeStatus.fromJson((jsonSerialization['status'] as int)),
      symbol: jsonSerialization['symbol'] as String,
      option: _i2.Option.fromJson((jsonSerialization['option'] as int)),
      feeCurrency: jsonSerialization['feeCurrency'] as String?,
      fee: (jsonSerialization['fee'] as num?)?.toDouble(),
      openTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['openTime']),
      closeTime: jsonSerialization['closeTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['closeTime']),
      lotSize: (jsonSerialization['lotSize'] as num).toDouble(),
      takeProfit: (jsonSerialization['takeProfit'] as num?)?.toDouble(),
      stopLoss: (jsonSerialization['stopLoss'] as num?)?.toDouble(),
    );
  }

  static final t = TradeTable();

  static const db = TradeRepository._();

  @override
  int? id;

  int linkedAccountId;

  _i2.LinkedAccount? linkedAccount;

  int userId;

  _i3.UserInfo? user;

  double? realizedPl;

  _i2.TradeStatus status;

  String symbol;

  _i2.Option option;

  String? feeCurrency;

  double? fee;

  DateTime openTime;

  DateTime? closeTime;

  double lotSize;

  double? takeProfit;

  double? stopLoss;

  @override
  _i1.Table get table => t;

  Trade copyWith({
    int? id,
    int? linkedAccountId,
    _i2.LinkedAccount? linkedAccount,
    int? userId,
    _i3.UserInfo? user,
    double? realizedPl,
    _i2.TradeStatus? status,
    String? symbol,
    _i2.Option? option,
    String? feeCurrency,
    double? fee,
    DateTime? openTime,
    DateTime? closeTime,
    double? lotSize,
    double? takeProfit,
    double? stopLoss,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'linkedAccountId': linkedAccountId,
      if (linkedAccount != null) 'linkedAccount': linkedAccount?.toJson(),
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (realizedPl != null) 'realizedPl': realizedPl,
      'status': status.toJson(),
      'symbol': symbol,
      'option': option.toJson(),
      if (feeCurrency != null) 'feeCurrency': feeCurrency,
      if (fee != null) 'fee': fee,
      'openTime': openTime.toJson(),
      if (closeTime != null) 'closeTime': closeTime?.toJson(),
      'lotSize': lotSize,
      if (takeProfit != null) 'takeProfit': takeProfit,
      if (stopLoss != null) 'stopLoss': stopLoss,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'linkedAccountId': linkedAccountId,
      if (linkedAccount != null)
        'linkedAccount': linkedAccount?.toJsonForProtocol(),
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (realizedPl != null) 'realizedPl': realizedPl,
      'status': status.toJson(),
      'symbol': symbol,
      'option': option.toJson(),
      if (feeCurrency != null) 'feeCurrency': feeCurrency,
      if (fee != null) 'fee': fee,
      'openTime': openTime.toJson(),
      if (closeTime != null) 'closeTime': closeTime?.toJson(),
      'lotSize': lotSize,
      if (takeProfit != null) 'takeProfit': takeProfit,
      if (stopLoss != null) 'stopLoss': stopLoss,
    };
  }

  static TradeInclude include({
    _i2.LinkedAccountInclude? linkedAccount,
    _i3.UserInfoInclude? user,
  }) {
    return TradeInclude._(
      linkedAccount: linkedAccount,
      user: user,
    );
  }

  static TradeIncludeList includeList({
    _i1.WhereExpressionBuilder<TradeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TradeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradeTable>? orderByList,
    TradeInclude? include,
  }) {
    return TradeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Trade.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Trade.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TradeImpl extends Trade {
  _TradeImpl({
    int? id,
    required int linkedAccountId,
    _i2.LinkedAccount? linkedAccount,
    required int userId,
    _i3.UserInfo? user,
    double? realizedPl,
    required _i2.TradeStatus status,
    required String symbol,
    required _i2.Option option,
    String? feeCurrency,
    double? fee,
    required DateTime openTime,
    DateTime? closeTime,
    required double lotSize,
    double? takeProfit,
    double? stopLoss,
  }) : super._(
          id: id,
          linkedAccountId: linkedAccountId,
          linkedAccount: linkedAccount,
          userId: userId,
          user: user,
          realizedPl: realizedPl,
          status: status,
          symbol: symbol,
          option: option,
          feeCurrency: feeCurrency,
          fee: fee,
          openTime: openTime,
          closeTime: closeTime,
          lotSize: lotSize,
          takeProfit: takeProfit,
          stopLoss: stopLoss,
        );

  @override
  Trade copyWith({
    Object? id = _Undefined,
    int? linkedAccountId,
    Object? linkedAccount = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? realizedPl = _Undefined,
    _i2.TradeStatus? status,
    String? symbol,
    _i2.Option? option,
    Object? feeCurrency = _Undefined,
    Object? fee = _Undefined,
    DateTime? openTime,
    Object? closeTime = _Undefined,
    double? lotSize,
    Object? takeProfit = _Undefined,
    Object? stopLoss = _Undefined,
  }) {
    return Trade(
      id: id is int? ? id : this.id,
      linkedAccountId: linkedAccountId ?? this.linkedAccountId,
      linkedAccount: linkedAccount is _i2.LinkedAccount?
          ? linkedAccount
          : this.linkedAccount?.copyWith(),
      userId: userId ?? this.userId,
      user: user is _i3.UserInfo? ? user : this.user?.copyWith(),
      realizedPl: realizedPl is double? ? realizedPl : this.realizedPl,
      status: status ?? this.status,
      symbol: symbol ?? this.symbol,
      option: option ?? this.option,
      feeCurrency: feeCurrency is String? ? feeCurrency : this.feeCurrency,
      fee: fee is double? ? fee : this.fee,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime is DateTime? ? closeTime : this.closeTime,
      lotSize: lotSize ?? this.lotSize,
      takeProfit: takeProfit is double? ? takeProfit : this.takeProfit,
      stopLoss: stopLoss is double? ? stopLoss : this.stopLoss,
    );
  }
}

class TradeTable extends _i1.Table {
  TradeTable({super.tableRelation}) : super(tableName: 'trade') {
    linkedAccountId = _i1.ColumnInt(
      'linkedAccountId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    realizedPl = _i1.ColumnDouble(
      'realizedPl',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byIndex,
    );
    symbol = _i1.ColumnString(
      'symbol',
      this,
    );
    option = _i1.ColumnEnum(
      'option',
      this,
      _i1.EnumSerialization.byIndex,
    );
    feeCurrency = _i1.ColumnString(
      'feeCurrency',
      this,
    );
    fee = _i1.ColumnDouble(
      'fee',
      this,
    );
    openTime = _i1.ColumnDateTime(
      'openTime',
      this,
    );
    closeTime = _i1.ColumnDateTime(
      'closeTime',
      this,
    );
    lotSize = _i1.ColumnDouble(
      'lotSize',
      this,
    );
    takeProfit = _i1.ColumnDouble(
      'takeProfit',
      this,
    );
    stopLoss = _i1.ColumnDouble(
      'stopLoss',
      this,
    );
  }

  late final _i1.ColumnInt linkedAccountId;

  _i2.LinkedAccountTable? _linkedAccount;

  late final _i1.ColumnInt userId;

  _i3.UserInfoTable? _user;

  late final _i1.ColumnDouble realizedPl;

  late final _i1.ColumnEnum<_i2.TradeStatus> status;

  late final _i1.ColumnString symbol;

  late final _i1.ColumnEnum<_i2.Option> option;

  late final _i1.ColumnString feeCurrency;

  late final _i1.ColumnDouble fee;

  late final _i1.ColumnDateTime openTime;

  late final _i1.ColumnDateTime closeTime;

  late final _i1.ColumnDouble lotSize;

  late final _i1.ColumnDouble takeProfit;

  late final _i1.ColumnDouble stopLoss;

  _i2.LinkedAccountTable get linkedAccount {
    if (_linkedAccount != null) return _linkedAccount!;
    _linkedAccount = _i1.createRelationTable(
      relationFieldName: 'linkedAccount',
      field: Trade.t.linkedAccountId,
      foreignField: _i2.LinkedAccount.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.LinkedAccountTable(tableRelation: foreignTableRelation),
    );
    return _linkedAccount!;
  }

  _i3.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Trade.t.userId,
      foreignField: _i3.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        linkedAccountId,
        userId,
        realizedPl,
        status,
        symbol,
        option,
        feeCurrency,
        fee,
        openTime,
        closeTime,
        lotSize,
        takeProfit,
        stopLoss,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'linkedAccount') {
      return linkedAccount;
    }
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class TradeInclude extends _i1.IncludeObject {
  TradeInclude._({
    _i2.LinkedAccountInclude? linkedAccount,
    _i3.UserInfoInclude? user,
  }) {
    _linkedAccount = linkedAccount;
    _user = user;
  }

  _i2.LinkedAccountInclude? _linkedAccount;

  _i3.UserInfoInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {
        'linkedAccount': _linkedAccount,
        'user': _user,
      };

  @override
  _i1.Table get table => Trade.t;
}

class TradeIncludeList extends _i1.IncludeList {
  TradeIncludeList._({
    _i1.WhereExpressionBuilder<TradeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Trade.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Trade.t;
}

class TradeRepository {
  const TradeRepository._();

  final attachRow = const TradeAttachRowRepository._();

  Future<List<Trade>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TradeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradeTable>? orderByList,
    _i1.Transaction? transaction,
    TradeInclude? include,
  }) async {
    return databaseAccessor.db.find<Trade>(
      where: where?.call(Trade.t),
      orderBy: orderBy?.call(Trade.t),
      orderByList: orderByList?.call(Trade.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Trade?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradeTable>? where,
    int? offset,
    _i1.OrderByBuilder<TradeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradeTable>? orderByList,
    _i1.Transaction? transaction,
    TradeInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<Trade>(
      where: where?.call(Trade.t),
      orderBy: orderBy?.call(Trade.t),
      orderByList: orderByList?.call(Trade.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Trade?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    TradeInclude? include,
  }) async {
    return databaseAccessor.db.findById<Trade>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<Trade>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Trade> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Trade>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Trade> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Trade row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Trade>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Trade>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Trade> rows, {
    _i1.ColumnSelections<TradeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Trade>(
      rows,
      columns: columns?.call(Trade.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Trade> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Trade row, {
    _i1.ColumnSelections<TradeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Trade>(
      row,
      columns: columns?.call(Trade.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Trade>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Trade> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Trade>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Trade> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Trade row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Trade>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Trade>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<TradeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Trade>(
      where: where(Trade.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TradeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Trade>(
      where: where?.call(Trade.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TradeAttachRowRepository {
  const TradeAttachRowRepository._();

  Future<void> linkedAccount(
    _i1.DatabaseAccessor databaseAccessor,
    Trade trade,
    _i2.LinkedAccount linkedAccount, {
    _i1.Transaction? transaction,
  }) async {
    if (trade.id == null) {
      throw ArgumentError.notNull('trade.id');
    }
    if (linkedAccount.id == null) {
      throw ArgumentError.notNull('linkedAccount.id');
    }

    var $trade = trade.copyWith(linkedAccountId: linkedAccount.id);
    await databaseAccessor.db.updateRow<Trade>(
      $trade,
      columns: [Trade.t.linkedAccountId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> user(
    _i1.DatabaseAccessor databaseAccessor,
    Trade trade,
    _i3.UserInfo user, {
    _i1.Transaction? transaction,
  }) async {
    if (trade.id == null) {
      throw ArgumentError.notNull('trade.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $trade = trade.copyWith(userId: user.id);
    await databaseAccessor.db.updateRow<Trade>(
      $trade,
      columns: [Trade.t.userId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
