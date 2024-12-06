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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'core/dto/linked_account_dto.dart' as _i4;
import 'core/dto/overview_statistics_dto.dart' as _i5;
import 'core/dto/statistics_dto.dart' as _i6;
import 'core/dto/trade_dto.dart' as _i7;
import 'core/dto/trade_list_dto.dart' as _i8;
import 'core/models/option.dart' as _i9;
import 'core/models/platform.dart' as _i10;
import 'core/models/trade_status.dart' as _i11;
import 'core/tables/linked_account.dart' as _i12;
import 'core/tables/note.dart' as _i13;
import 'core/tables/trade.dart' as _i14;
import 'core/tables/tradely_profile.dart' as _i15;
import 'platforms/meta/dto/meta_api_authentication_dto.dart' as _i16;
import 'platforms/meta/dto/meta_api_authentication_response_dto.dart' as _i17;
import 'platforms/meta/models/distance_trailing_stop_loss.dart' as _i18;
import 'platforms/meta/models/meta_account_information.dart' as _i19;
import 'platforms/meta/models/meta_trader_order.dart' as _i20;
import 'platforms/meta/models/meta_trader_position.dart' as _i21;
import 'platforms/meta/models/stop_loss_threshold.dart' as _i22;
import 'platforms/meta/models/threshold_trailing_stop_loss.dart' as _i23;
import 'platforms/meta/models/trailing_stop_loss.dart' as _i24;
import 'platforms/tradelocker/models/loss_limit_rule.dart' as _i25;
import 'platforms/tradelocker/models/risk_rules.dart' as _i26;
import 'platforms/tradelocker/models/tickcost.dart' as _i27;
import 'platforms/tradelocker/models/ticksize.dart' as _i28;
import 'platforms/tradelocker/models/tradelocker_account.dart' as _i29;
import 'platforms/tradelocker/models/tradelocker_account_info.dart' as _i30;
import 'platforms/tradelocker/models/tradelocker_instrument.dart' as _i31;
import 'platforms/tradelocker/models/tradelocker_order.dart' as _i32;
import 'platforms/tradelocker/models/tradelocker_position.dart' as _i33;
import 'platforms/tradelocker/models/trading_rules.dart' as _i34;
import 'package:tradelog_server/src/generated/core/dto/linked_account_dto.dart'
    as _i35;
import 'package:tradelog_server/src/generated/core/dto/trade_dto.dart' as _i36;
import 'package:tradelog_server/src/generated/core/tables/note.dart' as _i37;
import 'package:tradelog_server/src/generated/core/tables/trade.dart' as _i38;
export 'core/dto/linked_account_dto.dart';
export 'core/dto/overview_statistics_dto.dart';
export 'core/dto/statistics_dto.dart';
export 'core/dto/trade_dto.dart';
export 'core/dto/trade_list_dto.dart';
export 'core/models/option.dart';
export 'core/models/platform.dart';
export 'core/models/trade_status.dart';
export 'core/tables/linked_account.dart';
export 'core/tables/note.dart';
export 'core/tables/trade.dart';
export 'core/tables/tradely_profile.dart';
export 'platforms/meta/dto/meta_api_authentication_dto.dart';
export 'platforms/meta/dto/meta_api_authentication_response_dto.dart';
export 'platforms/meta/models/distance_trailing_stop_loss.dart';
export 'platforms/meta/models/meta_account_information.dart';
export 'platforms/meta/models/meta_trader_order.dart';
export 'platforms/meta/models/meta_trader_position.dart';
export 'platforms/meta/models/stop_loss_threshold.dart';
export 'platforms/meta/models/threshold_trailing_stop_loss.dart';
export 'platforms/meta/models/trailing_stop_loss.dart';
export 'platforms/tradelocker/models/loss_limit_rule.dart';
export 'platforms/tradelocker/models/risk_rules.dart';
export 'platforms/tradelocker/models/tickcost.dart';
export 'platforms/tradelocker/models/ticksize.dart';
export 'platforms/tradelocker/models/tradelocker_account.dart';
export 'platforms/tradelocker/models/tradelocker_account_info.dart';
export 'platforms/tradelocker/models/tradelocker_instrument.dart';
export 'platforms/tradelocker/models/tradelocker_order.dart';
export 'platforms/tradelocker/models/tradelocker_position.dart';
export 'platforms/tradelocker/models/trading_rules.dart';

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
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:Platform',
        ),
        _i2.ColumnDefinition(
          name: 'accountInformation',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'Map<String,String>',
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
        )
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
    if (t == _i4.LinkedAccountDto) {
      return _i4.LinkedAccountDto.fromJson(data) as T;
    }
    if (t == _i5.OverviewStatisticsDto) {
      return _i5.OverviewStatisticsDto.fromJson(data) as T;
    }
    if (t == _i6.StatisticsDto) {
      return _i6.StatisticsDto.fromJson(data) as T;
    }
    if (t == _i7.TradeDto) {
      return _i7.TradeDto.fromJson(data) as T;
    }
    if (t == _i8.TradeListDto) {
      return _i8.TradeListDto.fromJson(data) as T;
    }
    if (t == _i9.Option) {
      return _i9.Option.fromJson(data) as T;
    }
    if (t == _i10.Platform) {
      return _i10.Platform.fromJson(data) as T;
    }
    if (t == _i11.TradeStatus) {
      return _i11.TradeStatus.fromJson(data) as T;
    }
    if (t == _i12.LinkedAccount) {
      return _i12.LinkedAccount.fromJson(data) as T;
    }
    if (t == _i13.Note) {
      return _i13.Note.fromJson(data) as T;
    }
    if (t == _i14.Trade) {
      return _i14.Trade.fromJson(data) as T;
    }
    if (t == _i15.TradelyProfile) {
      return _i15.TradelyProfile.fromJson(data) as T;
    }
    if (t == _i16.MetaApiAuthenticationDto) {
      return _i16.MetaApiAuthenticationDto.fromJson(data) as T;
    }
    if (t == _i17.MetaApiAuthenticationResponseDto) {
      return _i17.MetaApiAuthenticationResponseDto.fromJson(data) as T;
    }
    if (t == _i18.DistanceTrailingStopLoss) {
      return _i18.DistanceTrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i19.MetaTradingAccountInformation) {
      return _i19.MetaTradingAccountInformation.fromJson(data) as T;
    }
    if (t == _i20.MetatraderOrder) {
      return _i20.MetatraderOrder.fromJson(data) as T;
    }
    if (t == _i21.MetatraderPosition) {
      return _i21.MetatraderPosition.fromJson(data) as T;
    }
    if (t == _i22.StopLossThreshold) {
      return _i22.StopLossThreshold.fromJson(data) as T;
    }
    if (t == _i23.ThresholdTrailingStopLoss) {
      return _i23.ThresholdTrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i24.TrailingStopLoss) {
      return _i24.TrailingStopLoss.fromJson(data) as T;
    }
    if (t == _i25.LossLimitRule) {
      return _i25.LossLimitRule.fromJson(data) as T;
    }
    if (t == _i26.RiskRules) {
      return _i26.RiskRules.fromJson(data) as T;
    }
    if (t == _i27.TickCost) {
      return _i27.TickCost.fromJson(data) as T;
    }
    if (t == _i28.TickSize) {
      return _i28.TickSize.fromJson(data) as T;
    }
    if (t == _i29.TradelockerCredentials) {
      return _i29.TradelockerCredentials.fromJson(data) as T;
    }
    if (t == _i30.TradelockerAccountInformation) {
      return _i30.TradelockerAccountInformation.fromJson(data) as T;
    }
    if (t == _i31.TradelockerInstrument) {
      return _i31.TradelockerInstrument.fromJson(data) as T;
    }
    if (t == _i32.TradelockerOrder) {
      return _i32.TradelockerOrder.fromJson(data) as T;
    }
    if (t == _i33.TradelockerPosition) {
      return _i33.TradelockerPosition.fromJson(data) as T;
    }
    if (t == _i34.TradingRules) {
      return _i34.TradingRules.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.LinkedAccountDto?>()) {
      return (data != null ? _i4.LinkedAccountDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.OverviewStatisticsDto?>()) {
      return (data != null ? _i5.OverviewStatisticsDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.StatisticsDto?>()) {
      return (data != null ? _i6.StatisticsDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.TradeDto?>()) {
      return (data != null ? _i7.TradeDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.TradeListDto?>()) {
      return (data != null ? _i8.TradeListDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Option?>()) {
      return (data != null ? _i9.Option.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Platform?>()) {
      return (data != null ? _i10.Platform.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TradeStatus?>()) {
      return (data != null ? _i11.TradeStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.LinkedAccount?>()) {
      return (data != null ? _i12.LinkedAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Note?>()) {
      return (data != null ? _i13.Note.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Trade?>()) {
      return (data != null ? _i14.Trade.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.TradelyProfile?>()) {
      return (data != null ? _i15.TradelyProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.MetaApiAuthenticationDto?>()) {
      return (data != null
          ? _i16.MetaApiAuthenticationDto.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i17.MetaApiAuthenticationResponseDto?>()) {
      return (data != null
          ? _i17.MetaApiAuthenticationResponseDto.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i18.DistanceTrailingStopLoss?>()) {
      return (data != null
          ? _i18.DistanceTrailingStopLoss.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i19.MetaTradingAccountInformation?>()) {
      return (data != null
          ? _i19.MetaTradingAccountInformation.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i20.MetatraderOrder?>()) {
      return (data != null ? _i20.MetatraderOrder.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.MetatraderPosition?>()) {
      return (data != null ? _i21.MetatraderPosition.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i22.StopLossThreshold?>()) {
      return (data != null ? _i22.StopLossThreshold.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.ThresholdTrailingStopLoss?>()) {
      return (data != null
          ? _i23.ThresholdTrailingStopLoss.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i24.TrailingStopLoss?>()) {
      return (data != null ? _i24.TrailingStopLoss.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.LossLimitRule?>()) {
      return (data != null ? _i25.LossLimitRule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.RiskRules?>()) {
      return (data != null ? _i26.RiskRules.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.TickCost?>()) {
      return (data != null ? _i27.TickCost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.TickSize?>()) {
      return (data != null ? _i28.TickSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.TradelockerCredentials?>()) {
      return (data != null ? _i29.TradelockerCredentials.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.TradelockerAccountInformation?>()) {
      return (data != null
          ? _i30.TradelockerAccountInformation.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i31.TradelockerInstrument?>()) {
      return (data != null ? _i31.TradelockerInstrument.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i32.TradelockerOrder?>()) {
      return (data != null ? _i32.TradelockerOrder.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.TradelockerPosition?>()) {
      return (data != null ? _i33.TradelockerPosition.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.TradingRules?>()) {
      return (data != null ? _i34.TradingRules.fromJson(data) : null) as T;
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
    if (t == _i1.getType<List<double>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<double>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<Map<DateTime, double>?>()) {
      return (data != null
          ? Map.fromEntries((data as List).map((e) => MapEntry(
              deserialize<DateTime>(e['k']), deserialize<double>(e['v']))))
          : null) as dynamic;
    }
    if (t == _i1.getType<Map<DateTime, double>?>()) {
      return (data != null
          ? Map.fromEntries((data as List).map((e) => MapEntry(
              deserialize<DateTime>(e['k']), deserialize<double>(e['v']))))
          : null) as dynamic;
    }
    if (t == List<_i7.TradeDto>) {
      return (data as List).map((e) => deserialize<_i7.TradeDto>(e)).toList()
          as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == List<_i22.StopLossThreshold>) {
      return (data as List)
          .map((e) => deserialize<_i22.StopLossThreshold>(e))
          .toList() as dynamic;
    }
    if (t == List<_i35.LinkedAccountDto>) {
      return (data as List)
          .map((e) => deserialize<_i35.LinkedAccountDto>(e))
          .toList() as dynamic;
    }
    if (t == List<_i36.TradeDto>) {
      return (data as List).map((e) => deserialize<_i36.TradeDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i37.Note>) {
      return (data as List).map((e) => deserialize<_i37.Note>(e)).toList()
          as dynamic;
    }
    if (t == Map<DateTime, double>) {
      return Map.fromEntries((data as List).map((e) => MapEntry(
              deserialize<DateTime>(e['k']), deserialize<double>(e['v']))))
          as dynamic;
    }
    if (t == List<_i38.Trade>) {
      return (data as List).map((e) => deserialize<_i38.Trade>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
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
    if (data is _i4.LinkedAccountDto) {
      return 'LinkedAccountDto';
    }
    if (data is _i5.OverviewStatisticsDto) {
      return 'OverviewStatisticsDto';
    }
    if (data is _i6.StatisticsDto) {
      return 'StatisticsDto';
    }
    if (data is _i7.TradeDto) {
      return 'TradeDto';
    }
    if (data is _i8.TradeListDto) {
      return 'TradeListDto';
    }
    if (data is _i9.Option) {
      return 'Option';
    }
    if (data is _i10.Platform) {
      return 'Platform';
    }
    if (data is _i11.TradeStatus) {
      return 'TradeStatus';
    }
    if (data is _i12.LinkedAccount) {
      return 'LinkedAccount';
    }
    if (data is _i13.Note) {
      return 'Note';
    }
    if (data is _i14.Trade) {
      return 'Trade';
    }
    if (data is _i15.TradelyProfile) {
      return 'TradelyProfile';
    }
    if (data is _i16.MetaApiAuthenticationDto) {
      return 'MetaApiAuthenticationDto';
    }
    if (data is _i17.MetaApiAuthenticationResponseDto) {
      return 'MetaApiAuthenticationResponseDto';
    }
    if (data is _i18.DistanceTrailingStopLoss) {
      return 'DistanceTrailingStopLoss';
    }
    if (data is _i19.MetaTradingAccountInformation) {
      return 'MetaTradingAccountInformation';
    }
    if (data is _i20.MetatraderOrder) {
      return 'MetatraderOrder';
    }
    if (data is _i21.MetatraderPosition) {
      return 'MetatraderPosition';
    }
    if (data is _i22.StopLossThreshold) {
      return 'StopLossThreshold';
    }
    if (data is _i23.ThresholdTrailingStopLoss) {
      return 'ThresholdTrailingStopLoss';
    }
    if (data is _i24.TrailingStopLoss) {
      return 'TrailingStopLoss';
    }
    if (data is _i25.LossLimitRule) {
      return 'LossLimitRule';
    }
    if (data is _i26.RiskRules) {
      return 'RiskRules';
    }
    if (data is _i27.TickCost) {
      return 'TickCost';
    }
    if (data is _i28.TickSize) {
      return 'TickSize';
    }
    if (data is _i29.TradelockerCredentials) {
      return 'TradelockerCredentials';
    }
    if (data is _i30.TradelockerAccountInformation) {
      return 'TradelockerAccountInformation';
    }
    if (data is _i31.TradelockerInstrument) {
      return 'TradelockerInstrument';
    }
    if (data is _i32.TradelockerOrder) {
      return 'TradelockerOrder';
    }
    if (data is _i33.TradelockerPosition) {
      return 'TradelockerPosition';
    }
    if (data is _i34.TradingRules) {
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
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'LinkedAccountDto') {
      return deserialize<_i4.LinkedAccountDto>(data['data']);
    }
    if (dataClassName == 'OverviewStatisticsDto') {
      return deserialize<_i5.OverviewStatisticsDto>(data['data']);
    }
    if (dataClassName == 'StatisticsDto') {
      return deserialize<_i6.StatisticsDto>(data['data']);
    }
    if (dataClassName == 'TradeDto') {
      return deserialize<_i7.TradeDto>(data['data']);
    }
    if (dataClassName == 'TradeListDto') {
      return deserialize<_i8.TradeListDto>(data['data']);
    }
    if (dataClassName == 'Option') {
      return deserialize<_i9.Option>(data['data']);
    }
    if (dataClassName == 'Platform') {
      return deserialize<_i10.Platform>(data['data']);
    }
    if (dataClassName == 'TradeStatus') {
      return deserialize<_i11.TradeStatus>(data['data']);
    }
    if (dataClassName == 'LinkedAccount') {
      return deserialize<_i12.LinkedAccount>(data['data']);
    }
    if (dataClassName == 'Note') {
      return deserialize<_i13.Note>(data['data']);
    }
    if (dataClassName == 'Trade') {
      return deserialize<_i14.Trade>(data['data']);
    }
    if (dataClassName == 'TradelyProfile') {
      return deserialize<_i15.TradelyProfile>(data['data']);
    }
    if (dataClassName == 'MetaApiAuthenticationDto') {
      return deserialize<_i16.MetaApiAuthenticationDto>(data['data']);
    }
    if (dataClassName == 'MetaApiAuthenticationResponseDto') {
      return deserialize<_i17.MetaApiAuthenticationResponseDto>(data['data']);
    }
    if (dataClassName == 'DistanceTrailingStopLoss') {
      return deserialize<_i18.DistanceTrailingStopLoss>(data['data']);
    }
    if (dataClassName == 'MetaTradingAccountInformation') {
      return deserialize<_i19.MetaTradingAccountInformation>(data['data']);
    }
    if (dataClassName == 'MetatraderOrder') {
      return deserialize<_i20.MetatraderOrder>(data['data']);
    }
    if (dataClassName == 'MetatraderPosition') {
      return deserialize<_i21.MetatraderPosition>(data['data']);
    }
    if (dataClassName == 'StopLossThreshold') {
      return deserialize<_i22.StopLossThreshold>(data['data']);
    }
    if (dataClassName == 'ThresholdTrailingStopLoss') {
      return deserialize<_i23.ThresholdTrailingStopLoss>(data['data']);
    }
    if (dataClassName == 'TrailingStopLoss') {
      return deserialize<_i24.TrailingStopLoss>(data['data']);
    }
    if (dataClassName == 'LossLimitRule') {
      return deserialize<_i25.LossLimitRule>(data['data']);
    }
    if (dataClassName == 'RiskRules') {
      return deserialize<_i26.RiskRules>(data['data']);
    }
    if (dataClassName == 'TickCost') {
      return deserialize<_i27.TickCost>(data['data']);
    }
    if (dataClassName == 'TickSize') {
      return deserialize<_i28.TickSize>(data['data']);
    }
    if (dataClassName == 'TradelockerCredentials') {
      return deserialize<_i29.TradelockerCredentials>(data['data']);
    }
    if (dataClassName == 'TradelockerAccountInformation') {
      return deserialize<_i30.TradelockerAccountInformation>(data['data']);
    }
    if (dataClassName == 'TradelockerInstrument') {
      return deserialize<_i31.TradelockerInstrument>(data['data']);
    }
    if (dataClassName == 'TradelockerOrder') {
      return deserialize<_i32.TradelockerOrder>(data['data']);
    }
    if (dataClassName == 'TradelockerPosition') {
      return deserialize<_i33.TradelockerPosition>(data['data']);
    }
    if (dataClassName == 'TradingRules') {
      return deserialize<_i34.TradingRules>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
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
      case _i12.LinkedAccount:
        return _i12.LinkedAccount.t;
      case _i13.Note:
        return _i13.Note.t;
      case _i14.Trade:
        return _i14.Trade.t;
      case _i15.TradelyProfile:
        return _i15.TradelyProfile.t;
      case _i29.TradelockerCredentials:
        return _i29.TradelockerCredentials.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'tradelog';
}
