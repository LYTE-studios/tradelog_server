/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'access_token.dart' as _i4;
import 'default/display_trade.dart' as _i5;
import 'default/option.dart' as _i6;
import 'default/trade.dart' as _i7;
import 'linked_accounts.dart' as _i8;
import 'meta/distance_trailing_stop_loss.dart' as _i9;
import 'meta/meta_account_information.dart' as _i10;
import 'meta/meta_trader_order.dart' as _i11;
import 'meta/meta_trader_position.dart' as _i12;
import 'meta/stop_loss_threshold.dart' as _i13;
import 'meta/threshold_trailing_stop_loss.dart' as _i14;
import 'meta/trailing_stop_loss.dart' as _i15;
import 'platform.dart' as _i16;
import 'tradelocker/loss_limit_rule.dart' as _i17;
import 'tradelocker/risk_rules.dart' as _i18;
import 'tradelocker/tradelocker_account.dart' as _i19;
import 'tradelocker/tradelocker_account_info.dart' as _i20;
import 'tradelocker/trading_rules.dart' as _i21;
import 'protocol.dart' as _i22;
import 'package:tradelog_server/src/generated/meta/meta_trader_position.dart'
    as _i23;
import 'package:tradelog_server/src/generated/default/display_trade.dart'
    as _i24;
import 'package:tradelog_server/src/generated/meta/meta_trader_order.dart'
    as _i25;
export 'access_token.dart';
export 'default/display_trade.dart';
export 'default/option.dart';
export 'default/trade.dart';
export 'linked_accounts.dart';
export 'meta/distance_trailing_stop_loss.dart';
export 'meta/meta_account_information.dart';
export 'meta/meta_trader_order.dart';
export 'meta/meta_trader_position.dart';
export 'meta/stop_loss_threshold.dart';
export 'meta/threshold_trailing_stop_loss.dart';
export 'meta/trailing_stop_loss.dart';
export 'platform.dart';
export 'tradelocker/loss_limit_rule.dart';
export 'tradelocker/risk_rules.dart';
export 'tradelocker/tradelocker_account.dart';
export 'tradelocker/tradelocker_account_info.dart';
export 'tradelocker/trading_rules.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'linked_account',
      dartName: 'LinkedAccount',
      schema: 'public',
      module: 'tradelog',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'linked_account_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'apiKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:Platform',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'linked_account_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'linked_account_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'trade',
      dartName: 'Trade',
      schema: 'public',
      module: 'tradelog',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'trade_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'option',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:Option',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fee',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lotSize',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'takeProfit',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'stoploss',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'profitLoss',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'trade_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'trade_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tradelocker_credentials',
      dartName: 'TradelockerCredentials',
      schema: 'public',
      module: 'tradelog',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'tradelocker_credentials_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'server',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'refreshToken',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'tradelocker_credentials_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tradelocker_credentials_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.AccessToken) {
      return _i4.AccessToken.fromJson(data) as T;
    }
    if (t == _i5.DisplayTrade) {
      return _i5.DisplayTrade.fromJson(data) as T;
    }
    if (t == _i6.Option) {
      return _i6.Option.fromJson(data) as T;
    }
    if (t == _i7.Trade) {
      return _i7.Trade.fromJson(data) as T;
    }
    if (t == _i8.LinkedAccount) {
      return _i8.LinkedAccount.fromJson(data) as T;
    }
    if (t == _i9.DistanceTrailingStopLoss) {
      return _i9.DistanceTrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i10.MetaTradingAccountInformation) {
      return _i10.MetaTradingAccountInformation.fromJson(data) as T;
    }
    if (t == _i11.MetatraderOrder) {
      return _i11.MetatraderOrder.fromJson(data) as T;
    }
    if (t == _i12.MetatraderPosition) {
      return _i12.MetatraderPosition.fromJson(data) as T;
    }
    if (t == _i13.StopLossThreshold) {
      return _i13.StopLossThreshold.fromJson(data) as T;
    }
    if (t == _i14.ThresholdTrailingStopLoss) {
      return _i14.ThresholdTrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i15.TrailingStopLoss) {
      return _i15.TrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i16.Platform) {
      return _i16.Platform.fromJson(data) as T;
    }
    if (t == _i17.LossLimitRule) {
      return _i17.LossLimitRule.fromJson(data) as T;
    }
    if (t == _i18.RiskRules) {
      return _i18.RiskRules.fromJson(data) as T;
    }
    if (t == _i19.TradelockerCredentials) {
      return _i19.TradelockerCredentials.fromJson(data) as T;
    }
    if (t == _i20.TradelockerAccountInformation) {
      return _i20.TradelockerAccountInformation.fromJson(data) as T;
    }
    if (t == _i21.TradingRules) {
      return _i21.TradingRules.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.AccessToken?>()) {
      return (data != null ? _i4.AccessToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DisplayTrade?>()) {
      return (data != null ? _i5.DisplayTrade.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Option?>()) {
      return (data != null ? _i6.Option.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Trade?>()) {
      return (data != null ? _i7.Trade.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.LinkedAccount?>()) {
      return (data != null ? _i8.LinkedAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DistanceTrailingStopLoss?>()) {
      return (data != null ? _i9.DistanceTrailingStopLoss.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.MetaTradingAccountInformation?>()) {
      return (data != null
          ? _i10.MetaTradingAccountInformation.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i11.MetatraderOrder?>()) {
      return (data != null ? _i11.MetatraderOrder.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.MetatraderPosition?>()) {
      return (data != null ? _i12.MetatraderPosition.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.StopLossThreshold?>()) {
      return (data != null ? _i13.StopLossThreshold.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ThresholdTrailingStopLoss?>()) {
      return (data != null
          ? _i14.ThresholdTrailingStopLoss.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i15.TrailingStopLoss?>()) {
      return (data != null ? _i15.TrailingStopLoss.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Platform?>()) {
      return (data != null ? _i16.Platform.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.LossLimitRule?>()) {
      return (data != null ? _i17.LossLimitRule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.RiskRules?>()) {
      return (data != null ? _i18.RiskRules.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.TradelockerCredentials?>()) {
      return (data != null ? _i19.TradelockerCredentials.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.TradelockerAccountInformation?>()) {
      return (data != null
          ? _i20.TradelockerAccountInformation.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i21.TradingRules?>()) {
      return (data != null ? _i21.TradingRules.fromJson(data) : null) as T;
    }
    if (t == List<_i22.StopLossThreshold>) {
      return (data as List)
          .map((e) => deserialize<_i22.StopLossThreshold>(e))
          .toList() as dynamic;
    }
    if (t == List<_i23.MetatraderPosition>) {
      return (data as List)
          .map((e) => deserialize<_i23.MetatraderPosition>(e))
          .toList() as dynamic;
    }
    if (t == List<_i24.DisplayTrade>) {
      return (data as List)
          .map((e) => deserialize<_i24.DisplayTrade>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.MetatraderOrder>) {
      return (data as List)
          .map((e) => deserialize<_i25.MetatraderOrder>(e))
          .toList() as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.AccessToken) {
      return 'AccessToken';
    }
    if (data is _i5.DisplayTrade) {
      return 'DisplayTrade';
    }
    if (data is _i6.Option) {
      return 'Option';
    }
    if (data is _i7.Trade) {
      return 'Trade';
    }
    if (data is _i8.LinkedAccount) {
      return 'LinkedAccount';
    }
    if (data is _i9.DistanceTrailingStopLoss) {
      return 'DistanceTrailingStopLoss';
    }
    if (data is _i10.MetaTradingAccountInformation) {
      return 'MetaTradingAccountInformation';
    }
    if (data is _i11.MetatraderOrder) {
      return 'MetatraderOrder';
    }
    if (data is _i12.MetatraderPosition) {
      return 'MetatraderPosition';
    }
    if (data is _i13.StopLossThreshold) {
      return 'StopLossThreshold';
    }
    if (data is _i14.ThresholdTrailingStopLoss) {
      return 'ThresholdTrailingStopLoss';
    }
    if (data is _i15.TrailingStopLoss) {
      return 'TrailingStopLoss';
    }
    if (data is _i16.Platform) {
      return 'Platform';
    }
    if (data is _i17.LossLimitRule) {
      return 'LossLimitRule';
    }
    if (data is _i18.RiskRules) {
      return 'RiskRules';
    }
    if (data is _i19.TradelockerCredentials) {
      return 'TradelockerCredentials';
    }
    if (data is _i20.TradelockerAccountInformation) {
      return 'TradelockerAccountInformation';
    }
    if (data is _i21.TradingRules) {
      return 'TradingRules';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'AccessToken') {
      return deserialize<_i4.AccessToken>(data['data']);
    }
    if (data['className'] == 'DisplayTrade') {
      return deserialize<_i5.DisplayTrade>(data['data']);
    }
    if (data['className'] == 'Option') {
      return deserialize<_i6.Option>(data['data']);
    }
    if (data['className'] == 'Trade') {
      return deserialize<_i7.Trade>(data['data']);
    }
    if (data['className'] == 'LinkedAccount') {
      return deserialize<_i8.LinkedAccount>(data['data']);
    }
    if (data['className'] == 'DistanceTrailingStopLoss') {
      return deserialize<_i9.DistanceTrailingStopLoss>(data['data']);
    }
    if (data['className'] == 'MetaTradingAccountInformation') {
      return deserialize<_i10.MetaTradingAccountInformation>(data['data']);
    }
    if (data['className'] == 'MetatraderOrder') {
      return deserialize<_i11.MetatraderOrder>(data['data']);
    }
    if (data['className'] == 'MetatraderPosition') {
      return deserialize<_i12.MetatraderPosition>(data['data']);
    }
    if (data['className'] == 'StopLossThreshold') {
      return deserialize<_i13.StopLossThreshold>(data['data']);
    }
    if (data['className'] == 'ThresholdTrailingStopLoss') {
      return deserialize<_i14.ThresholdTrailingStopLoss>(data['data']);
    }
    if (data['className'] == 'TrailingStopLoss') {
      return deserialize<_i15.TrailingStopLoss>(data['data']);
    }
    if (data['className'] == 'Platform') {
      return deserialize<_i16.Platform>(data['data']);
    }
    if (data['className'] == 'LossLimitRule') {
      return deserialize<_i17.LossLimitRule>(data['data']);
    }
    if (data['className'] == 'RiskRules') {
      return deserialize<_i18.RiskRules>(data['data']);
    }
    if (data['className'] == 'TradelockerCredentials') {
      return deserialize<_i19.TradelockerCredentials>(data['data']);
    }
    if (data['className'] == 'TradelockerAccountInformation') {
      return deserialize<_i20.TradelockerAccountInformation>(data['data']);
    }
    if (data['className'] == 'TradingRules') {
      return deserialize<_i21.TradingRules>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i7.Trade:
        return _i7.Trade.t;
      case _i8.LinkedAccount:
        return _i8.LinkedAccount.t;
      case _i19.TradelockerCredentials:
        return _i19.TradelockerCredentials.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'tradelog';
}
