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
import '../endpoints/note_endpoint.dart' as _i5;
import '../endpoints/profile_endpoint.dart' as _i6;
import '../endpoints/statistics_endpoint.dart' as _i7;
import '../endpoints/trade_endpoint.dart' as _i8;
import 'package:tradelog_server/src/generated/core/tables/note.dart' as _i9;
import 'package:tradelog_server/src/generated/core/tables/tradely_profile.dart'
    as _i10;
import 'package:tradelog_server/src/generated/core/dto/trade_dto.dart' as _i11;
import 'package:tradelog_server/src/generated/core/tables/trade.dart' as _i12;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i13;

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
      'note': _i5.NoteEndpoint()
        ..initialize(
          server,
          'note',
          null,
        ),
      'profile': _i6.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'statistics': _i7.StatisticsEndpoint()
        ..initialize(
          server,
          'statistics',
          null,
        ),
      'trade': _i8.TradeEndpoint()
        ..initialize(
          server,
          'trade',
          null,
        ),
    };
    connectors['account'] = _i1.EndpointConnector(
      name: 'account',
      endpoint: endpoints['account']!,
      methodConnectors: {
        'removeAccount': _i1.MethodConnector(
          name: 'removeAccount',
          params: {
            'accountId': _i1.ParameterDescription(
              name: 'accountId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['account'] as _i2.AccountEndpoint).removeAccount(
            session,
            params['accountId'],
          ),
        ),
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
        'getTrades': _i1.MethodConnector(
          name: 'getTrades',
          params: {
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['global'] as _i4.GlobalEndpoint).getTrades(
            session,
            from: params['from'],
            to: params['to'],
          ),
        ),
        'refreshCaches': _i1.MethodConnector(
          name: 'refreshCaches',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['global'] as _i4.GlobalEndpoint)
                  .refreshCaches(session),
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
              (endpoints['note'] as _i5.NoteEndpoint).getNoteForDate(
            session,
            params['date'],
          ),
        ),
        'deleteNote': _i1.MethodConnector(
          name: 'deleteNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i9.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i5.NoteEndpoint).deleteNote(
            session,
            params['note'],
          ),
        ),
        'updateNote': _i1.MethodConnector(
          name: 'updateNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i9.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i5.NoteEndpoint).updateNote(
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
              (endpoints['note'] as _i5.NoteEndpoint).getNotes(session),
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
              type: _i1.getType<_i10.TradelyProfile>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i6.ProfileEndpoint).updateProfile(
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
              (endpoints['profile'] as _i6.ProfileEndpoint).getProfile(session),
        ),
      },
    );
    connectors['statistics'] = _i1.EndpointConnector(
      name: 'statistics',
      endpoint: endpoints['statistics']!,
      methodConnectors: {
        'getAccountBalanceChart': _i1.MethodConnector(
          name: 'getAccountBalanceChart',
          params: {
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['statistics'] as _i7.StatisticsEndpoint)
                  .getAccountBalanceChart(
            session,
            from: params['from'],
            to: params['to'],
          ),
        ),
        'getOverviewStatistics': _i1.MethodConnector(
          name: 'getOverviewStatistics',
          params: {
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['statistics'] as _i7.StatisticsEndpoint)
                  .getOverviewStatistics(
            session,
            from: params['from'],
            to: params['to'],
          ),
        ),
        'getStatistics': _i1.MethodConnector(
          name: 'getStatistics',
          params: {
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['statistics'] as _i7.StatisticsEndpoint).getStatistics(
            session,
            from: params['from'],
            to: params['to'],
          ),
        ),
        'getDiaryStatistics': _i1.MethodConnector(
          name: 'getDiaryStatistics',
          params: {
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['statistics'] as _i7.StatisticsEndpoint)
                  .getDiaryStatistics(
            session,
            from: params['from'],
            to: params['to'],
          ),
        ),
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
              type: _i1.getType<_i11.TradeDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trade'] as _i8.TradeEndpoint).addTrade(
            session,
            params['dto'],
          ),
        ),
        'deleteTrade': _i1.MethodConnector(
          name: 'deleteTrade',
          params: {
            'trade': _i1.ParameterDescription(
              name: 'trade',
              type: _i1.getType<_i12.Trade>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trade'] as _i8.TradeEndpoint).deleteTrade(
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
              (endpoints['trade'] as _i8.TradeEndpoint).fetchTrades(session),
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
              (endpoints['trade'] as _i8.TradeEndpoint).importTrades(
            session,
            params['csvFile'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i13.Endpoints()..initializeEndpoints(server);
  }
}
