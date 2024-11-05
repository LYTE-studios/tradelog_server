/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'access_token.dart' as _i4;
import 'default/display_trade.dart' as _i5;
import 'default/display_trade_list.dart' as _i6;
import 'default/note.dart' as _i7;
import 'default/option.dart' as _i8;
import 'default/trade.dart' as _i9;
import 'linked_accounts.dart' as _i10;
import 'meta/distance_trailing_stop_loss.dart' as _i11;
import 'meta/meta_account_information.dart' as _i12;
import 'meta/meta_trader_order.dart' as _i13;
import 'meta/meta_trader_position.dart' as _i14;
import 'meta/stop_loss_threshold.dart' as _i15;
import 'meta/threshold_trailing_stop_loss.dart' as _i16;
import 'meta/trailing_stop_loss.dart' as _i17;
import 'platform.dart' as _i18;
import 'profile/tradely_profile.dart' as _i19;
import 'tradelocker/loss_limit_rule.dart' as _i20;
import 'tradelocker/risk_rules.dart' as _i21;
import 'tradelocker/tickcost.dart' as _i22;
import 'tradelocker/ticksize.dart' as _i23;
import 'tradelocker/tradelocker_account.dart' as _i24;
import 'tradelocker/tradelocker_account_info.dart' as _i25;
import 'tradelocker/tradelocker_instrument.dart' as _i26;
import 'tradelocker/tradelocker_order.dart' as _i27;
import 'tradelocker/tradelocker_position.dart' as _i28;
import 'tradelocker/trading_rules.dart' as _i29;
import 'protocol.dart' as _i30;
import 'package:tradelog_server/src/generated/linked_accounts.dart' as _i31;
import 'package:tradelog_server/src/generated/default/display_trade.dart'
    as _i32;
import 'package:tradelog_server/src/generated/meta/meta_trader_position.dart'
    as _i33;
import 'package:tradelog_server/src/generated/meta/meta_trader_order.dart'
    as _i34;
import 'package:tradelog_server/src/generated/default/note.dart' as _i35;
import 'package:tradelog_server/src/generated/default/trade.dart' as _i36;
import 'package:tradelog_server/src/generated/tradelocker/tradelocker_order.dart'
    as _i37;
import 'package:tradelog_server/src/generated/tradelocker/tradelocker_account_info.dart'
    as _i38;
export 'access_token.dart';
export 'default/display_trade.dart';
export 'default/display_trade_list.dart';
export 'default/note.dart';
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
export 'profile/tradely_profile.dart';
export 'tradelocker/loss_limit_rule.dart';
export 'tradelocker/risk_rules.dart';
export 'tradelocker/tickcost.dart';
export 'tradelocker/ticksize.dart';
export 'tradelocker/tradelocker_account.dart';
export 'tradelocker/tradelocker_account_info.dart';
export 'tradelocker/tradelocker_instrument.dart';
export 'tradelocker/tradelocker_order.dart';
export 'tradelocker/tradelocker_position.dart';
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
        _i2.ColumnDefinition(
          name: 'tradelockerCredentialsId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'tradelockerAccountId',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'tradelockerAccounts',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'metaID',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
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
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'linked_account_fk_1',
          columns: ['tradelockerCredentialsId'],
          referenceTable: 'tradelocker_credentials',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
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
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'note',
      dartName: 'Note',
      schema: 'public',
      module: 'tradelog',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'note_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'note_fk_0',
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
          indexName: 'note_pkey',
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
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
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
    _i2.TableDefinition(
      name: 'tradely_profile',
      dartName: 'TradelyProfile',
      schema: 'public',
      module: 'tradelog',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tradely_profile_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dateOfBirth',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'tradely_profile_fk_0',
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
          indexName: 'tradely_profile_pkey',
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
    if (t == _i6.DisplayTradeList) {
      return _i6.DisplayTradeList.fromJson(data) as T;
    }
    if (t == _i7.Note) {
      return _i7.Note.fromJson(data) as T;
    }
    if (t == _i8.Option) {
      return _i8.Option.fromJson(data) as T;
    }
    if (t == _i9.Trade) {
      return _i9.Trade.fromJson(data) as T;
    }
    if (t == _i10.LinkedAccount) {
      return _i10.LinkedAccount.fromJson(data) as T;
    }
    if (t == _i11.DistanceTrailingStopLoss) {
      return _i11.DistanceTrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i12.MetaTradingAccountInformation) {
      return _i12.MetaTradingAccountInformation.fromJson(data) as T;
    }
    if (t == _i13.MetatraderOrder) {
      return _i13.MetatraderOrder.fromJson(data) as T;
    }
    if (t == _i14.MetatraderPosition) {
      return _i14.MetatraderPosition.fromJson(data) as T;
    }
    if (t == _i15.StopLossThreshold) {
      return _i15.StopLossThreshold.fromJson(data) as T;
    }
    if (t == _i16.ThresholdTrailingStopLoss) {
      return _i16.ThresholdTrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i17.TrailingStopLoss) {
      return _i17.TrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i18.Platform) {
      return _i18.Platform.fromJson(data) as T;
    }
    if (t == _i19.TradelyProfile) {
      return _i19.TradelyProfile.fromJson(data) as T;
    }
    if (t == _i20.LossLimitRule) {
      return _i20.LossLimitRule.fromJson(data) as T;
    }
    if (t == _i21.RiskRules) {
      return _i21.RiskRules.fromJson(data) as T;
    }
    if (t == _i22.TickCost) {
      return _i22.TickCost.fromJson(data) as T;
    }
    if (t == _i23.TickSize) {
      return _i23.TickSize.fromJson(data) as T;
    }
    if (t == _i24.TradelockerCredentials) {
      return _i24.TradelockerCredentials.fromJson(data) as T;
    }
    if (t == _i25.TradelockerAccountInformation) {
      return _i25.TradelockerAccountInformation.fromJson(data) as T;
    }
    if (t == _i26.TradelockerInstrument) {
      return _i26.TradelockerInstrument.fromJson(data) as T;
    }
    if (t == _i27.TradelockerOrder) {
      return _i27.TradelockerOrder.fromJson(data) as T;
    }
    if (t == _i28.TradelockerPosition) {
      return _i28.TradelockerPosition.fromJson(data) as T;
    }
    if (t == _i29.TradingRules) {
      return _i29.TradingRules.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.AccessToken?>()) {
      return (data != null ? _i4.AccessToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DisplayTrade?>()) {
      return (data != null ? _i5.DisplayTrade.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DisplayTradeList?>()) {
      return (data != null ? _i6.DisplayTradeList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Note?>()) {
      return (data != null ? _i7.Note.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Option?>()) {
      return (data != null ? _i8.Option.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Trade?>()) {
      return (data != null ? _i9.Trade.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.LinkedAccount?>()) {
      return (data != null ? _i10.LinkedAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DistanceTrailingStopLoss?>()) {
      return (data != null
          ? _i11.DistanceTrailingStopLoss.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i12.MetaTradingAccountInformation?>()) {
      return (data != null
          ? _i12.MetaTradingAccountInformation.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i13.MetatraderOrder?>()) {
      return (data != null ? _i13.MetatraderOrder.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.MetatraderPosition?>()) {
      return (data != null ? _i14.MetatraderPosition.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.StopLossThreshold?>()) {
      return (data != null ? _i15.StopLossThreshold.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.ThresholdTrailingStopLoss?>()) {
      return (data != null
          ? _i16.ThresholdTrailingStopLoss.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i17.TrailingStopLoss?>()) {
      return (data != null ? _i17.TrailingStopLoss.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Platform?>()) {
      return (data != null ? _i18.Platform.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.TradelyProfile?>()) {
      return (data != null ? _i19.TradelyProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.LossLimitRule?>()) {
      return (data != null ? _i20.LossLimitRule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.RiskRules?>()) {
      return (data != null ? _i21.RiskRules.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.TickCost?>()) {
      return (data != null ? _i22.TickCost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.TickSize?>()) {
      return (data != null ? _i23.TickSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.TradelockerCredentials?>()) {
      return (data != null ? _i24.TradelockerCredentials.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.TradelockerAccountInformation?>()) {
      return (data != null
          ? _i25.TradelockerAccountInformation.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i26.TradelockerInstrument?>()) {
      return (data != null ? _i26.TradelockerInstrument.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.TradelockerOrder?>()) {
      return (data != null ? _i27.TradelockerOrder.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.TradelockerPosition?>()) {
      return (data != null ? _i28.TradelockerPosition.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.TradingRules?>()) {
      return (data != null ? _i29.TradingRules.fromJson(data) : null) as T;
    }
    if (t == List<_i30.DisplayTrade>) {
      return (data as List)
          .map((e) => deserialize<_i30.DisplayTrade>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i30.StopLossThreshold>) {
      return (data as List)
          .map((e) => deserialize<_i30.StopLossThreshold>(e))
          .toList() as dynamic;
    }
    if (t == List<_i30.TickCost>) {
      return (data as List).map((e) => deserialize<_i30.TickCost>(e)).toList()
          as dynamic;
    }
    if (t == List<_i30.TickSize>) {
      return (data as List).map((e) => deserialize<_i30.TickSize>(e)).toList()
          as dynamic;
    }
    if (t == List<_i31.LinkedAccount>) {
      return (data as List)
          .map((e) => deserialize<_i31.LinkedAccount>(e))
          .toList() as dynamic;
    }
    if (t == List<_i32.DisplayTrade>) {
      return (data as List)
          .map((e) => deserialize<_i32.DisplayTrade>(e))
          .toList() as dynamic;
    }
    if (t == List<_i33.MetatraderPosition>) {
      return (data as List)
          .map((e) => deserialize<_i33.MetatraderPosition>(e))
          .toList() as dynamic;
    }
    if (t == List<_i34.MetatraderOrder>) {
      return (data as List)
          .map((e) => deserialize<_i34.MetatraderOrder>(e))
          .toList() as dynamic;
    }
    if (t == List<_i35.Note>) {
      return (data as List).map((e) => deserialize<_i35.Note>(e)).toList()
          as dynamic;
    }
    if (t == List<_i36.Trade>) {
      return (data as List).map((e) => deserialize<_i36.Trade>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i37.TradelockerOrder>) {
      return (data as List)
          .map((e) => deserialize<_i37.TradelockerOrder>(e))
          .toList() as dynamic;
    }
    if (t == List<_i38.TradelockerAccountInformation>) {
      return (data as List)
          .map((e) => deserialize<_i38.TradelockerAccountInformation>(e))
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
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.AccessToken) {
      return 'AccessToken';
    }
    if (data is _i5.DisplayTrade) {
      return 'DisplayTrade';
    }
    if (data is _i6.DisplayTradeList) {
      return 'DisplayTradeList';
    }
    if (data is _i7.Note) {
      return 'Note';
    }
    if (data is _i8.Option) {
      return 'Option';
    }
    if (data is _i9.Trade) {
      return 'Trade';
    }
    if (data is _i10.LinkedAccount) {
      return 'LinkedAccount';
    }
    if (data is _i11.DistanceTrailingStopLoss) {
      return 'DistanceTrailingStopLoss';
    }
    if (data is _i12.MetaTradingAccountInformation) {
      return 'MetaTradingAccountInformation';
    }
    if (data is _i13.MetatraderOrder) {
      return 'MetatraderOrder';
    }
    if (data is _i14.MetatraderPosition) {
      return 'MetatraderPosition';
    }
    if (data is _i15.StopLossThreshold) {
      return 'StopLossThreshold';
    }
    if (data is _i16.ThresholdTrailingStopLoss) {
      return 'ThresholdTrailingStopLoss';
    }
    if (data is _i17.TrailingStopLoss) {
      return 'TrailingStopLoss';
    }
    if (data is _i18.Platform) {
      return 'Platform';
    }
    if (data is _i19.TradelyProfile) {
      return 'TradelyProfile';
    }
    if (data is _i20.LossLimitRule) {
      return 'LossLimitRule';
    }
    if (data is _i21.RiskRules) {
      return 'RiskRules';
    }
    if (data is _i22.TickCost) {
      return 'TickCost';
    }
    if (data is _i23.TickSize) {
      return 'TickSize';
    }
    if (data is _i24.TradelockerCredentials) {
      return 'TradelockerCredentials';
    }
    if (data is _i25.TradelockerAccountInformation) {
      return 'TradelockerAccountInformation';
    }
    if (data is _i26.TradelockerInstrument) {
      return 'TradelockerInstrument';
    }
    if (data is _i27.TradelockerOrder) {
      return 'TradelockerOrder';
    }
    if (data is _i28.TradelockerPosition) {
      return 'TradelockerPosition';
    }
    if (data is _i29.TradingRules) {
      return 'TradingRules';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'AccessToken') {
      return deserialize<_i4.AccessToken>(data['data']);
    }
    if (data['className'] == 'DisplayTrade') {
      return deserialize<_i5.DisplayTrade>(data['data']);
    }
    if (data['className'] == 'DisplayTradeList') {
      return deserialize<_i6.DisplayTradeList>(data['data']);
    }
    if (data['className'] == 'Note') {
      return deserialize<_i7.Note>(data['data']);
    }
    if (data['className'] == 'Option') {
      return deserialize<_i8.Option>(data['data']);
    }
    if (data['className'] == 'Trade') {
      return deserialize<_i9.Trade>(data['data']);
    }
    if (data['className'] == 'LinkedAccount') {
      return deserialize<_i10.LinkedAccount>(data['data']);
    }
    if (data['className'] == 'DistanceTrailingStopLoss') {
      return deserialize<_i11.DistanceTrailingStopLoss>(data['data']);
    }
    if (data['className'] == 'MetaTradingAccountInformation') {
      return deserialize<_i12.MetaTradingAccountInformation>(data['data']);
    }
    if (data['className'] == 'MetatraderOrder') {
      return deserialize<_i13.MetatraderOrder>(data['data']);
    }
    if (data['className'] == 'MetatraderPosition') {
      return deserialize<_i14.MetatraderPosition>(data['data']);
    }
    if (data['className'] == 'StopLossThreshold') {
      return deserialize<_i15.StopLossThreshold>(data['data']);
    }
    if (data['className'] == 'ThresholdTrailingStopLoss') {
      return deserialize<_i16.ThresholdTrailingStopLoss>(data['data']);
    }
    if (data['className'] == 'TrailingStopLoss') {
      return deserialize<_i17.TrailingStopLoss>(data['data']);
    }
    if (data['className'] == 'Platform') {
      return deserialize<_i18.Platform>(data['data']);
    }
    if (data['className'] == 'TradelyProfile') {
      return deserialize<_i19.TradelyProfile>(data['data']);
    }
    if (data['className'] == 'LossLimitRule') {
      return deserialize<_i20.LossLimitRule>(data['data']);
    }
    if (data['className'] == 'RiskRules') {
      return deserialize<_i21.RiskRules>(data['data']);
    }
    if (data['className'] == 'TickCost') {
      return deserialize<_i22.TickCost>(data['data']);
    }
    if (data['className'] == 'TickSize') {
      return deserialize<_i23.TickSize>(data['data']);
    }
    if (data['className'] == 'TradelockerCredentials') {
      return deserialize<_i24.TradelockerCredentials>(data['data']);
    }
    if (data['className'] == 'TradelockerAccountInformation') {
      return deserialize<_i25.TradelockerAccountInformation>(data['data']);
    }
    if (data['className'] == 'TradelockerInstrument') {
      return deserialize<_i26.TradelockerInstrument>(data['data']);
    }
    if (data['className'] == 'TradelockerOrder') {
      return deserialize<_i27.TradelockerOrder>(data['data']);
    }
    if (data['className'] == 'TradelockerPosition') {
      return deserialize<_i28.TradelockerPosition>(data['data']);
    }
    if (data['className'] == 'TradingRules') {
      return deserialize<_i29.TradingRules>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
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
      case _i7.Note:
        return _i7.Note.t;
      case _i9.Trade:
        return _i9.Trade.t;
      case _i10.LinkedAccount:
        return _i10.LinkedAccount.t;
      case _i19.TradelyProfile:
        return _i19.TradelyProfile.t;
      case _i24.TradelockerCredentials:
        return _i24.TradelockerCredentials.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'tradelog';
}
