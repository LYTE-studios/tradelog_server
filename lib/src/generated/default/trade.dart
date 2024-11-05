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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;

abstract class Trade implements _i1.TableRow, _i1.ProtocolSerialization {
  Trade._({
    this.id,
    required this.platform,
    required this.option,
    required this.userId,
    this.user,
    required this.currency,
    required this.fee,
    required this.date,
    required this.lotSize,
    required this.takeProfit,
    required this.stoploss,
    required this.profitLoss,
    required this.amount,
  });

  factory Trade({
    int? id,
    required String platform,
    required _i2.Option option,
    required int userId,
    _i3.UserInfo? user,
    required String currency,
    required double fee,
    required DateTime date,
    required double lotSize,
    required double takeProfit,
    required double stoploss,
    required String profitLoss,
    required double amount,
  }) = _TradeImpl;

  factory Trade.fromJson(Map<String, dynamic> jsonSerialization) {
    return Trade(
      id: jsonSerialization['id'] as int?,
      platform: jsonSerialization['platform'] as String,
      option: _i2.Option.fromJson((jsonSerialization['option'] as int)),
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i3.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      currency: jsonSerialization['currency'] as String,
      fee: (jsonSerialization['fee'] as num).toDouble(),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      lotSize: (jsonSerialization['lotSize'] as num).toDouble(),
      takeProfit: (jsonSerialization['takeProfit'] as num).toDouble(),
      stoploss: (jsonSerialization['stoploss'] as num).toDouble(),
      profitLoss: jsonSerialization['profitLoss'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
    );
  }

  static final t = TradeTable();

  static const db = TradeRepository._();

  @override
  int? id;

  String platform;

  _i2.Option option;

  int userId;

  _i3.UserInfo? user;

  String currency;

  double fee;

  DateTime date;

  double lotSize;

  double takeProfit;

  double stoploss;

  String profitLoss;

  double amount;

  @override
  _i1.Table get table => t;

  Trade copyWith({
    int? id,
    String? platform,
    _i2.Option? option,
    int? userId,
    _i3.UserInfo? user,
    String? currency,
    double? fee,
    DateTime? date,
    double? lotSize,
    double? takeProfit,
    double? stoploss,
    String? profitLoss,
    double? amount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'platform': platform,
      'option': option.toJson(),
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'currency': currency,
      'fee': fee,
      'date': date.toJson(),
      'lotSize': lotSize,
      'takeProfit': takeProfit,
      'stoploss': stoploss,
      'profitLoss': profitLoss,
      'amount': amount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'platform': platform,
      'option': option.toJson(),
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'currency': currency,
      'fee': fee,
      'date': date.toJson(),
      'lotSize': lotSize,
      'takeProfit': takeProfit,
      'stoploss': stoploss,
      'profitLoss': profitLoss,
      'amount': amount,
    };
  }

  static TradeInclude include({_i3.UserInfoInclude? user}) {
    return TradeInclude._(user: user);
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
    required String platform,
    required _i2.Option option,
    required int userId,
    _i3.UserInfo? user,
    required String currency,
    required double fee,
    required DateTime date,
    required double lotSize,
    required double takeProfit,
    required double stoploss,
    required String profitLoss,
    required double amount,
  }) : super._(
          id: id,
          platform: platform,
          option: option,
          userId: userId,
          user: user,
          currency: currency,
          fee: fee,
          date: date,
          lotSize: lotSize,
          takeProfit: takeProfit,
          stoploss: stoploss,
          profitLoss: profitLoss,
          amount: amount,
        );

  @override
  Trade copyWith({
    Object? id = _Undefined,
    String? platform,
    _i2.Option? option,
    int? userId,
    Object? user = _Undefined,
    String? currency,
    double? fee,
    DateTime? date,
    double? lotSize,
    double? takeProfit,
    double? stoploss,
    String? profitLoss,
    double? amount,
  }) {
    return Trade(
      id: id is int? ? id : this.id,
      platform: platform ?? this.platform,
      option: option ?? this.option,
      userId: userId ?? this.userId,
      user: user is _i3.UserInfo? ? user : this.user?.copyWith(),
      currency: currency ?? this.currency,
      fee: fee ?? this.fee,
      date: date ?? this.date,
      lotSize: lotSize ?? this.lotSize,
      takeProfit: takeProfit ?? this.takeProfit,
      stoploss: stoploss ?? this.stoploss,
      profitLoss: profitLoss ?? this.profitLoss,
      amount: amount ?? this.amount,
    );
  }
}

class TradeTable extends _i1.Table {
  TradeTable({super.tableRelation}) : super(tableName: 'trade') {
    platform = _i1.ColumnString(
      'platform',
      this,
    );
    option = _i1.ColumnEnum(
      'option',
      this,
      _i1.EnumSerialization.byIndex,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
    );
    fee = _i1.ColumnDouble(
      'fee',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
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
    stoploss = _i1.ColumnDouble(
      'stoploss',
      this,
    );
    profitLoss = _i1.ColumnString(
      'profitLoss',
      this,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
  }

  late final _i1.ColumnString platform;

  late final _i1.ColumnEnum<_i2.Option> option;

  late final _i1.ColumnInt userId;

  _i3.UserInfoTable? _user;

  late final _i1.ColumnString currency;

  late final _i1.ColumnDouble fee;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnDouble lotSize;

  late final _i1.ColumnDouble takeProfit;

  late final _i1.ColumnDouble stoploss;

  late final _i1.ColumnString profitLoss;

  late final _i1.ColumnDouble amount;

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
        platform,
        option,
        userId,
        currency,
        fee,
        date,
        lotSize,
        takeProfit,
        stoploss,
        profitLoss,
        amount,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class TradeInclude extends _i1.IncludeObject {
  TradeInclude._({_i3.UserInfoInclude? user}) {
    _user = user;
  }

  _i3.UserInfoInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TradeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TradeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradeTable>? orderByList,
    _i1.Transaction? transaction,
    TradeInclude? include,
  }) async {
    return session.db.find<Trade>(
      where: where?.call(Trade.t),
      orderBy: orderBy?.call(Trade.t),
      orderByList: orderByList?.call(Trade.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Trade?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TradeTable>? where,
    int? offset,
    _i1.OrderByBuilder<TradeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TradeTable>? orderByList,
    _i1.Transaction? transaction,
    TradeInclude? include,
  }) async {
    return session.db.findFirstRow<Trade>(
      where: where?.call(Trade.t),
      orderBy: orderBy?.call(Trade.t),
      orderByList: orderByList?.call(Trade.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Trade?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TradeInclude? include,
  }) async {
    return session.db.findById<Trade>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Trade>> insert(
    _i1.Session session,
    List<Trade> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Trade>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Trade> insertRow(
    _i1.Session session,
    Trade row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Trade>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Trade>> update(
    _i1.Session session,
    List<Trade> rows, {
    _i1.ColumnSelections<TradeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Trade>(
      rows,
      columns: columns?.call(Trade.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Trade> updateRow(
    _i1.Session session,
    Trade row, {
    _i1.ColumnSelections<TradeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Trade>(
      row,
      columns: columns?.call(Trade.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Trade>> delete(
    _i1.Session session,
    List<Trade> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Trade>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Trade> deleteRow(
    _i1.Session session,
    Trade row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Trade>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Trade>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TradeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Trade>(
      where: where(Trade.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TradeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Trade>(
      where: where?.call(Trade.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class TradeAttachRowRepository {
  const TradeAttachRowRepository._();

  Future<void> user(
    _i1.Session session,
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
    await session.db.updateRow<Trade>(
      $trade,
      columns: [Trade.t.userId],
      transaction: transaction ?? session.transaction,
    );
  }
}
