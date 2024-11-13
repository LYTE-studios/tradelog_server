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
import 'core/access_token.dart' as _i4;
import 'core/option.dart' as _i5;
import 'core/platform.dart' as _i6;
import 'core/trade_status.dart' as _i7;
import 'dto/statistics/overview_statistics_dto.dart' as _i8;
import 'dto/trades/trade_dto.dart' as _i9;
import 'dto/trades/trade_list_dto.dart' as _i10;
import 'platforms/meta/distance_trailing_stop_loss.dart' as _i11;
import 'platforms/meta/meta_account_information.dart' as _i12;
import 'platforms/meta/meta_trader_order.dart' as _i13;
import 'platforms/meta/meta_trader_position.dart' as _i14;
import 'platforms/meta/stop_loss_threshold.dart' as _i15;
import 'platforms/meta/threshold_trailing_stop_loss.dart' as _i16;
import 'platforms/meta/trailing_stop_loss.dart' as _i17;
import 'platforms/tradelocker/loss_limit_rule.dart' as _i18;
import 'platforms/tradelocker/risk_rules.dart' as _i19;
import 'platforms/tradelocker/tickcost.dart' as _i20;
import 'platforms/tradelocker/ticksize.dart' as _i21;
import 'platforms/tradelocker/tradelocker_account.dart' as _i22;
import 'platforms/tradelocker/tradelocker_account_info.dart' as _i23;
import 'platforms/tradelocker/tradelocker_instrument.dart' as _i24;
import 'platforms/tradelocker/tradelocker_order.dart' as _i25;
import 'platforms/tradelocker/tradelocker_position.dart' as _i26;
import 'platforms/tradelocker/trading_rules.dart' as _i27;
import 'profile/tradely_profile.dart' as _i28;
import 'tables/linked_account.dart' as _i29;
import 'tables/note.dart' as _i30;
import 'tables/trade.dart' as _i31;
import 'protocol.dart' as _i32;
import 'package:tradelog_server/src/generated/tables/linked_account.dart'
    as _i33;
import 'package:tradelog_server/src/generated/dto/trades/trade_dto.dart'
    as _i34;
import 'package:tradelog_server/src/generated/platforms/meta/meta_trader_position.dart'
    as _i35;
import 'package:tradelog_server/src/generated/platforms/meta/meta_trader_order.dart'
    as _i36;
import 'package:tradelog_server/src/generated/tables/note.dart' as _i37;
import 'package:tradelog_server/src/generated/tables/trade.dart' as _i38;
import 'package:tradelog_server/src/generated/platforms/tradelocker/tradelocker_account_info.dart'
    as _i39;
export 'core/access_token.dart';
export 'core/option.dart';
export 'core/platform.dart';
export 'core/trade_status.dart';
export 'dto/statistics/overview_statistics_dto.dart';
export 'dto/trades/trade_dto.dart';
export 'dto/trades/trade_list_dto.dart';
export 'platforms/meta/distance_trailing_stop_loss.dart';
export 'platforms/meta/meta_account_information.dart';
export 'platforms/meta/meta_trader_order.dart';
export 'platforms/meta/meta_trader_position.dart';
export 'platforms/meta/stop_loss_threshold.dart';
export 'platforms/meta/threshold_trailing_stop_loss.dart';
export 'platforms/meta/trailing_stop_loss.dart';
export 'platforms/tradelocker/loss_limit_rule.dart';
export 'platforms/tradelocker/risk_rules.dart';
export 'platforms/tradelocker/tickcost.dart';
export 'platforms/tradelocker/ticksize.dart';
export 'platforms/tradelocker/tradelocker_account.dart';
export 'platforms/tradelocker/tradelocker_account_info.dart';
export 'platforms/tradelocker/tradelocker_instrument.dart';
export 'platforms/tradelocker/tradelocker_order.dart';
export 'platforms/tradelocker/tradelocker_position.dart';
export 'platforms/tradelocker/trading_rules.dart';
export 'profile/tradely_profile.dart';
export 'tables/linked_account.dart';
export 'tables/note.dart';
export 'tables/trade.dart';

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
          name: 'apiUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'apiKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'refreshToken',
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
        _i2.ColumnDefinition(
          name: 'title',
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
          name: 'linkedAccountId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'realizedPl',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:TradeStatus',
        ),
        _i2.ColumnDefinition(
          name: 'symbol',
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
          name: 'feeCurrency',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fee',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'openTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'closeTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
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
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'stopLoss',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'trade_fk_0',
          columns: ['linkedAccountId'],
          referenceTable: 'linked_account',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'trade_fk_1',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
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
    if (t == _i5.Option) {
      return _i5.Option.fromJson(data) as T;
    }
    if (t == _i6.Platform) {
      return _i6.Platform.fromJson(data) as T;
    }
    if (t == _i7.TradeStatus) {
      return _i7.TradeStatus.fromJson(data) as T;
    }
    if (t == _i8.OverviewStatisticsDto) {
      return _i8.OverviewStatisticsDto.fromJson(data) as T;
    }
    if (t == _i9.TradeDto) {
      return _i9.TradeDto.fromJson(data) as T;
    }
    if (t == _i10.TradeListDto) {
      return _i10.TradeListDto.fromJson(data) as T;
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
    if (t == _i18.LossLimitRule) {
      return _i18.LossLimitRule.fromJson(data) as T;
    }
    if (t == _i19.RiskRules) {
      return _i19.RiskRules.fromJson(data) as T;
    }
    if (t == _i20.TickCost) {
      return _i20.TickCost.fromJson(data) as T;
    }
    if (t == _i21.TickSize) {
      return _i21.TickSize.fromJson(data) as T;
    }
    if (t == _i22.TradelockerCredentials) {
      return _i22.TradelockerCredentials.fromJson(data) as T;
    }
    if (t == _i23.TradelockerAccountInformation) {
      return _i23.TradelockerAccountInformation.fromJson(data) as T;
    }
    if (t == _i24.TradelockerInstrument) {
      return _i24.TradelockerInstrument.fromJson(data) as T;
    }
    if (t == _i25.TradelockerOrder) {
      return _i25.TradelockerOrder.fromJson(data) as T;
    }
    if (t == _i26.TradelockerPosition) {
      return _i26.TradelockerPosition.fromJson(data) as T;
    }
    if (t == _i27.TradingRules) {
      return _i27.TradingRules.fromJson(data) as T;
    }
    if (t == _i28.TradelyProfile) {
      return _i28.TradelyProfile.fromJson(data) as T;
    }
    if (t == _i29.LinkedAccount) {
      return _i29.LinkedAccount.fromJson(data) as T;
    }
    if (t == _i30.Note) {
      return _i30.Note.fromJson(data) as T;
    }
    if (t == _i31.Trade) {
      return _i31.Trade.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.AccessToken?>()) {
      return (data != null ? _i4.AccessToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Option?>()) {
      return (data != null ? _i5.Option.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Platform?>()) {
      return (data != null ? _i6.Platform.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.TradeStatus?>()) {
      return (data != null ? _i7.TradeStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.OverviewStatisticsDto?>()) {
      return (data != null ? _i8.OverviewStatisticsDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.TradeDto?>()) {
      return (data != null ? _i9.TradeDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TradeListDto?>()) {
      return (data != null ? _i10.TradeListDto.fromJson(data) : null) as T;
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
    if (t == _i1.getType<_i18.LossLimitRule?>()) {
      return (data != null ? _i18.LossLimitRule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.RiskRules?>()) {
      return (data != null ? _i19.RiskRules.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.TickCost?>()) {
      return (data != null ? _i20.TickCost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.TickSize?>()) {
      return (data != null ? _i21.TickSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.TradelockerCredentials?>()) {
      return (data != null ? _i22.TradelockerCredentials.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.TradelockerAccountInformation?>()) {
      return (data != null
          ? _i23.TradelockerAccountInformation.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i24.TradelockerInstrument?>()) {
      return (data != null ? _i24.TradelockerInstrument.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.TradelockerOrder?>()) {
      return (data != null ? _i25.TradelockerOrder.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.TradelockerPosition?>()) {
      return (data != null ? _i26.TradelockerPosition.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.TradingRules?>()) {
      return (data != null ? _i27.TradingRules.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.TradelyProfile?>()) {
      return (data != null ? _i28.TradelyProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.LinkedAccount?>()) {
      return (data != null ? _i29.LinkedAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.Note?>()) {
      return (data != null ? _i30.Note.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Trade?>()) {
      return (data != null ? _i31.Trade.fromJson(data) : null) as T;
    }
    if (t == List<_i32.TradeDto>) {
      return (data as List).map((e) => deserialize<_i32.TradeDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i32.StopLossThreshold>) {
      return (data as List)
          .map((e) => deserialize<_i32.StopLossThreshold>(e))
          .toList() as dynamic;
    }
    if (t == List<_i32.TickCost>) {
      return (data as List).map((e) => deserialize<_i32.TickCost>(e)).toList()
          as dynamic;
    }
    if (t == List<_i32.TickSize>) {
      return (data as List).map((e) => deserialize<_i32.TickSize>(e)).toList()
          as dynamic;
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
    if (t == List<_i33.LinkedAccount>) {
      return (data as List)
          .map((e) => deserialize<_i33.LinkedAccount>(e))
          .toList() as dynamic;
    }
    if (t == List<_i34.TradeDto>) {
      return (data as List).map((e) => deserialize<_i34.TradeDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i35.MetatraderPosition>) {
      return (data as List)
          .map((e) => deserialize<_i35.MetatraderPosition>(e))
          .toList() as dynamic;
    }
    if (t == List<_i36.MetatraderOrder>) {
      return (data as List)
          .map((e) => deserialize<_i36.MetatraderOrder>(e))
          .toList() as dynamic;
    }
    if (t == List<_i37.Note>) {
      return (data as List).map((e) => deserialize<_i37.Note>(e)).toList()
          as dynamic;
    }
    if (t == List<_i38.Trade>) {
      return (data as List).map((e) => deserialize<_i38.Trade>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as dynamic;
    }
    if (t == List<_i39.TradelockerAccountInformation>) {
      return (data as List)
          .map((e) => deserialize<_i39.TradelockerAccountInformation>(e))
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
    if (data is _i5.Option) {
      return 'Option';
    }
    if (data is _i6.Platform) {
      return 'Platform';
    }
    if (data is _i7.TradeStatus) {
      return 'TradeStatus';
    }
    if (data is _i8.OverviewStatisticsDto) {
      return 'OverviewStatisticsDto';
    }
    if (data is _i9.TradeDto) {
      return 'TradeDto';
    }
    if (data is _i10.TradeListDto) {
      return 'TradeListDto';
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
    if (data is _i18.LossLimitRule) {
      return 'LossLimitRule';
    }
    if (data is _i19.RiskRules) {
      return 'RiskRules';
    }
    if (data is _i20.TickCost) {
      return 'TickCost';
    }
    if (data is _i21.TickSize) {
      return 'TickSize';
    }
    if (data is _i22.TradelockerCredentials) {
      return 'TradelockerCredentials';
    }
    if (data is _i23.TradelockerAccountInformation) {
      return 'TradelockerAccountInformation';
    }
    if (data is _i24.TradelockerInstrument) {
      return 'TradelockerInstrument';
    }
    if (data is _i25.TradelockerOrder) {
      return 'TradelockerOrder';
    }
    if (data is _i26.TradelockerPosition) {
      return 'TradelockerPosition';
    }
    if (data is _i27.TradingRules) {
      return 'TradingRules';
    }
    if (data is _i28.TradelyProfile) {
      return 'TradelyProfile';
    }
    if (data is _i29.LinkedAccount) {
      return 'LinkedAccount';
    }
    if (data is _i30.Note) {
      return 'Note';
    }
    if (data is _i31.Trade) {
      return 'Trade';
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
    if (data['className'] == 'Option') {
      return deserialize<_i5.Option>(data['data']);
    }
    if (data['className'] == 'Platform') {
      return deserialize<_i6.Platform>(data['data']);
    }
    if (data['className'] == 'TradeStatus') {
      return deserialize<_i7.TradeStatus>(data['data']);
    }
    if (data['className'] == 'OverviewStatisticsDto') {
      return deserialize<_i8.OverviewStatisticsDto>(data['data']);
    }
    if (data['className'] == 'TradeDto') {
      return deserialize<_i9.TradeDto>(data['data']);
    }
    if (data['className'] == 'TradeListDto') {
      return deserialize<_i10.TradeListDto>(data['data']);
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
    if (data['className'] == 'LossLimitRule') {
      return deserialize<_i18.LossLimitRule>(data['data']);
    }
    if (data['className'] == 'RiskRules') {
      return deserialize<_i19.RiskRules>(data['data']);
    }
    if (data['className'] == 'TickCost') {
      return deserialize<_i20.TickCost>(data['data']);
    }
    if (data['className'] == 'TickSize') {
      return deserialize<_i21.TickSize>(data['data']);
    }
    if (data['className'] == 'TradelockerCredentials') {
      return deserialize<_i22.TradelockerCredentials>(data['data']);
    }
    if (data['className'] == 'TradelockerAccountInformation') {
      return deserialize<_i23.TradelockerAccountInformation>(data['data']);
    }
    if (data['className'] == 'TradelockerInstrument') {
      return deserialize<_i24.TradelockerInstrument>(data['data']);
    }
    if (data['className'] == 'TradelockerOrder') {
      return deserialize<_i25.TradelockerOrder>(data['data']);
    }
    if (data['className'] == 'TradelockerPosition') {
      return deserialize<_i26.TradelockerPosition>(data['data']);
    }
    if (data['className'] == 'TradingRules') {
      return deserialize<_i27.TradingRules>(data['data']);
    }
    if (data['className'] == 'TradelyProfile') {
      return deserialize<_i28.TradelyProfile>(data['data']);
    }
    if (data['className'] == 'LinkedAccount') {
      return deserialize<_i29.LinkedAccount>(data['data']);
    }
    if (data['className'] == 'Note') {
      return deserialize<_i30.Note>(data['data']);
    }
    if (data['className'] == 'Trade') {
      return deserialize<_i31.Trade>(data['data']);
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
      case _i22.TradelockerCredentials:
        return _i22.TradelockerCredentials.t;
      case _i28.TradelyProfile:
        return _i28.TradelyProfile.t;
      case _i29.LinkedAccount:
        return _i29.LinkedAccount.t;
      case _i30.Note:
        return _i30.Note.t;
      case _i31.Trade:
        return _i31.Trade.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'tradelog';
}
