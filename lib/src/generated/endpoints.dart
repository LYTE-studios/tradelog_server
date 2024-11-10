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
import '../endpoints/account_endpoint.dart' as _i2;
import '../endpoints/file_endpoint.dart' as _i3;
import '../endpoints/global_endpoint.dart' as _i4;
import '../endpoints/metaapi_endpoint.dart' as _i5;
import '../endpoints/note_endpoint.dart' as _i6;
import '../endpoints/profile_endpoint.dart' as _i7;
import '../endpoints/statistics_endpoint.dart' as _i8;
import '../endpoints/trade_endpoint.dart' as _i9;
import '../endpoints/tradelocker_endpoint.dart' as _i10;
import 'package:tradelog_server/src/generated/linked_accounts.dart' as _i11;
import 'package:tradelog_server/src/generated/default/note.dart' as _i12;
import 'package:tradelog_server/src/generated/profile/tradely_profile.dart'
    as _i13;
import 'package:tradelog_server/src/generated/dto/trade_dto.dart' as _i14;
import 'package:tradelog_server/src/generated/default/trade.dart' as _i15;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i16;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'account': _i2.AccountEndpoint()
        ..initialize(
          server,
          'account',
          null,
        ),
      'file': _i3.FileEndpoint()
        ..initialize(
          server,
          'file',
          null,
        ),
      'global': _i4.GlobalEndpoint()
        ..initialize(
          server,
          'global',
          null,
        ),
      'metaApi': _i5.MetaApiEndpoint()
        ..initialize(
          server,
          'metaApi',
          null,
        ),
      'note': _i6.NoteEndpoint()
        ..initialize(
          server,
          'note',
          null,
        ),
      'profile': _i7.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'statistics': _i8.StatisticsEndpoint()
        ..initialize(
          server,
          'statistics',
          null,
        ),
      'trade': _i9.TradeEndpoint()
        ..initialize(
          server,
          'trade',
          null,
        ),
      'tradeLocker': _i10.TradeLockerEndpoint()
        ..initialize(
          server,
          'tradeLocker',
          null,
        ),
    };
    connectors['account'] = _i1.EndpointConnector(
      name: 'account',
      endpoint: endpoints['account']!,
      methodConnectors: {
        'fetchAccounts': _i1.MethodConnector(
          name: 'fetchAccounts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['account'] as _i2.AccountEndpoint)
                  .fetchAccounts(session),
        ),
        'linkAccount': _i1.MethodConnector(
          name: 'linkAccount',
          params: {
            'account': _i1.ParameterDescription(
              name: 'account',
              type: _i1.getType<_i11.LinkedAccount>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['account'] as _i2.AccountEndpoint).linkAccount(
            session,
            params['account'],
          ),
        ),
        'unlinkAccount': _i1.MethodConnector(
          name: 'unlinkAccount',
          params: {
            'account': _i1.ParameterDescription(
              name: 'account',
              type: _i1.getType<_i11.LinkedAccount>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['account'] as _i2.AccountEndpoint).unlinkAccount(
            session,
            params['account'],
          ),
        ),
      },
    );
    connectors['file'] = _i1.EndpointConnector(
      name: 'file',
      endpoint: endpoints['file']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['file'] as _i3.FileEndpoint).getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['file'] as _i3.FileEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['global'] = _i1.EndpointConnector(
      name: 'global',
      endpoint: endpoints['global']!,
      methodConnectors: {
        'fetchFromAPIs': _i1.MethodConnector(
          name: 'fetchFromAPIs',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['global'] as _i4.GlobalEndpoint)
                  .fetchFromAPIs(session),
        ),
        'getCachedTrades': _i1.MethodConnector(
          name: 'getCachedTrades',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['global'] as _i4.GlobalEndpoint)
                  .getCachedTrades(session),
        ),
      },
    );
    connectors['metaApi'] = _i1.EndpointConnector(
      name: 'metaApi',
      endpoint: endpoints['metaApi']!,
      methodConnectors: {
        'initializeClient': _i1.MethodConnector(
          name: 'initializeClient',
          params: {
            'accNum': _i1.ParameterDescription(
              name: 'accNum',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['metaApi'] as _i5.MetaApiEndpoint).initializeClient(
            session,
            accNum: params['accNum'],
          ),
        ),
        'authenticate': _i1.MethodConnector(
          name: 'authenticate',
          params: {
            'apiKey': _i1.ParameterDescription(
              name: 'apiKey',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'metaId': _i1.ParameterDescription(
              name: 'metaId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['metaApi'] as _i5.MetaApiEndpoint).authenticate(
            session,
            params['apiKey'],
            params['metaId'],
            title: params['title'],
          ),
        ),
        'getAccountInformation': _i1.MethodConnector(
          name: 'getAccountInformation',
          params: {
            'accountId': _i1.ParameterDescription(
              name: 'accountId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['metaApi'] as _i5.MetaApiEndpoint)
                  .getAccountInformation(
            session,
            params['accountId'],
          ),
        ),
        'getPositions': _i1.MethodConnector(
          name: 'getPositions',
          params: {
            'accountId': _i1.ParameterDescription(
              name: 'accountId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['metaApi'] as _i5.MetaApiEndpoint).getPositions(
            session,
            params['accountId'],
          ),
        ),
        'getTrades': _i1.MethodConnector(
          name: 'getTrades',
          params: {
            'accountId': _i1.ParameterDescription(
              name: 'accountId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['metaApi'] as _i5.MetaApiEndpoint).getTrades(
            session,
            params['accountId'],
          ),
        ),
        'getOrders': _i1.MethodConnector(
          name: 'getOrders',
          params: {
            'accountId': _i1.ParameterDescription(
              name: 'accountId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['metaApi'] as _i5.MetaApiEndpoint).getOrders(
            session,
            params['accountId'],
          ),
        ),
        'getHistoryOrdersByTime': _i1.MethodConnector(
          name: 'getHistoryOrdersByTime',
          params: {
            'accountId': _i1.ParameterDescription(
              name: 'accountId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'startTime': _i1.ParameterDescription(
              name: 'startTime',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'endTime': _i1.ParameterDescription(
              name: 'endTime',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['metaApi'] as _i5.MetaApiEndpoint)
                  .getHistoryOrdersByTime(
            session,
            params['accountId'],
            params['startTime'],
            params['endTime'],
          ),
        ),
      },
    );
    connectors['note'] = _i1.EndpointConnector(
      name: 'note',
      endpoint: endpoints['note']!,
      methodConnectors: {
        'getNoteForDate': _i1.MethodConnector(
          name: 'getNoteForDate',
          params: {
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i6.NoteEndpoint).getNoteForDate(
            session,
            params['date'],
          ),
        ),
        'deleteNote': _i1.MethodConnector(
          name: 'deleteNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i12.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i6.NoteEndpoint).deleteNote(
            session,
            params['note'],
          ),
        ),
        'updateNote': _i1.MethodConnector(
          name: 'updateNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i12.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i6.NoteEndpoint).updateNote(
            session,
            params['note'],
          ),
        ),
        'getNotes': _i1.MethodConnector(
          name: 'getNotes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i6.NoteEndpoint).getNotes(session),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'updateProfile': _i1.MethodConnector(
          name: 'updateProfile',
          params: {
            'profile': _i1.ParameterDescription(
              name: 'profile',
              type: _i1.getType<_i13.TradelyProfile>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i7.ProfileEndpoint).updateProfile(
            session,
            params['profile'],
          ),
        ),
        'getProfile': _i1.MethodConnector(
          name: 'getProfile',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i7.ProfileEndpoint).getProfile(session),
        ),
      },
    );
    connectors['statistics'] = _i1.EndpointConnector(
      name: 'statistics',
      endpoint: endpoints['statistics']!,
      methodConnectors: {
        'getOverviewStatistics': _i1.MethodConnector(
          name: 'getOverviewStatistics',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['statistics'] as _i8.StatisticsEndpoint)
                  .getOverviewStatistics(session),
        )
      },
    );
    connectors['trade'] = _i1.EndpointConnector(
      name: 'trade',
      endpoint: endpoints['trade']!,
      methodConnectors: {
        'addTrade': _i1.MethodConnector(
          name: 'addTrade',
          params: {
            'dto': _i1.ParameterDescription(
              name: 'dto',
              type: _i1.getType<_i14.TradeDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trade'] as _i9.TradeEndpoint).addTrade(
            session,
            params['dto'],
          ),
        ),
        'deleteTrade': _i1.MethodConnector(
          name: 'deleteTrade',
          params: {
            'trade': _i1.ParameterDescription(
              name: 'trade',
              type: _i1.getType<_i15.Trade>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trade'] as _i9.TradeEndpoint).deleteTrade(
            session,
            params['trade'],
          ),
        ),
        'fetchTrades': _i1.MethodConnector(
          name: 'fetchTrades',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trade'] as _i9.TradeEndpoint).fetchTrades(session),
        ),
        'importTrades': _i1.MethodConnector(
          name: 'importTrades',
          params: {
            'csvFile': _i1.ParameterDescription(
              name: 'csvFile',
              type: _i1.getType<List<int>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trade'] as _i9.TradeEndpoint).importTrades(
            session,
            params['csvFile'],
          ),
        ),
      },
    );
    connectors['tradeLocker'] = _i1.EndpointConnector(
      name: 'tradeLocker',
      endpoint: endpoints['tradeLocker']!,
      methodConnectors: {
        'initializeClient': _i1.MethodConnector(
          name: 'initializeClient',
          params: {
            'apiKey': _i1.ParameterDescription(
              name: 'apiKey',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'accNum': _i1.ParameterDescription(
              name: 'accNum',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i10.TradeLockerEndpoint)
                  .initializeClient(
            session,
            params['apiKey'],
            accNum: params['accNum'],
          ),
        ),
        'authenticate': _i1.MethodConnector(
          name: 'authenticate',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'server': _i1.ParameterDescription(
              name: 'server',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i10.TradeLockerEndpoint)
                  .authenticate(
            session,
            params['email'],
            params['password'],
            params['server'],
            title: params['title'],
          ),
        ),
        'refresh': _i1.MethodConnector(
          name: 'refresh',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i10.TradeLockerEndpoint)
                  .refresh(session),
        ),
        'getAllTrades': _i1.MethodConnector(
          name: 'getAllTrades',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i10.TradeLockerEndpoint)
                  .getAllTrades(session),
        ),
        'getTrades': _i1.MethodConnector(
          name: 'getTrades',
          params: {
            'apiKey': _i1.ParameterDescription(
              name: 'apiKey',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'accountId': _i1.ParameterDescription(
              name: 'accountId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'accNum': _i1.ParameterDescription(
              name: 'accNum',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i10.TradeLockerEndpoint).getTrades(
            session,
            params['apiKey'],
            params['accountId'],
            params['accNum'],
          ),
        ),
        'getRawOrders': _i1.MethodConnector(
          name: 'getRawOrders',
          params: {
            'account': _i1.ParameterDescription(
              name: 'account',
              type: _i1.getType<_i11.LinkedAccount>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i10.TradeLockerEndpoint)
                  .getRawOrders(
            session,
            params['account'],
          ),
        ),
        'getOrdersHistoryWithRateLimit': _i1.MethodConnector(
          name: 'getOrdersHistoryWithRateLimit',
          params: {
            'apiKey': _i1.ParameterDescription(
              name: 'apiKey',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'accountId': _i1.ParameterDescription(
              name: 'accountId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'accNum': _i1.ParameterDescription(
              name: 'accNum',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i10.TradeLockerEndpoint)
                  .getOrdersHistoryWithRateLimit(
            session,
            params['apiKey'],
            params['accountId'],
            params['accNum'],
          ),
        ),
        'getAccounts': _i1.MethodConnector(
          name: 'getAccounts',
          params: {
            'apiKey': _i1.ParameterDescription(
              name: 'apiKey',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i10.TradeLockerEndpoint)
                  .getAccounts(
            session,
            params['apiKey'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i16.Endpoints()..initializeEndpoints(server);
  }
}
