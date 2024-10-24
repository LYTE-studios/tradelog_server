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
import '../endpoints/metaapi_endpoint.dart' as _i3;
import '../endpoints/note_endpoint.dart' as _i4;
import '../endpoints/profile_endpoint.dart' as _i5;
import '../endpoints/trade_endpoint.dart' as _i6;
import '../endpoints/tradelocker_endpoint.dart' as _i7;
import 'package:tradelog_server/src/generated/linked_accounts.dart' as _i8;
import 'package:tradelog_server/src/generated/default/note.dart' as _i9;
import 'package:tradelog_server/src/generated/profile/tradely_profile.dart'
    as _i10;
import 'package:tradelog_server/src/generated/default/trade.dart' as _i11;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i12;

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
      'metaApi': _i3.MetaApiEndpoint()
        ..initialize(
          server,
          'metaApi',
          null,
        ),
      'note': _i4.NoteEndpoint()
        ..initialize(
          server,
          'note',
          null,
        ),
      'profile': _i5.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'trade': _i6.TradeEndpoint()
        ..initialize(
          server,
          'trade',
          null,
        ),
      'tradeLocker': _i7.TradeLockerEndpoint()
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
              type: _i1.getType<_i8.LinkedAccount>(),
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
              type: _i1.getType<_i8.LinkedAccount>(),
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
              (endpoints['metaApi'] as _i3.MetaApiEndpoint).initializeClient(
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
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['metaApi'] as _i3.MetaApiEndpoint).authenticate(
            session,
            params['apiKey'],
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
              (endpoints['metaApi'] as _i3.MetaApiEndpoint)
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
              (endpoints['metaApi'] as _i3.MetaApiEndpoint).getPositions(
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
              (endpoints['metaApi'] as _i3.MetaApiEndpoint).getTrades(
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
              (endpoints['metaApi'] as _i3.MetaApiEndpoint).getOrders(
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
              (endpoints['metaApi'] as _i3.MetaApiEndpoint)
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
        'addNote': _i1.MethodConnector(
          name: 'addNote',
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
              (endpoints['note'] as _i4.NoteEndpoint).addNote(
            session,
            params['note'],
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
              (endpoints['note'] as _i4.NoteEndpoint).deleteNote(
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
              (endpoints['note'] as _i4.NoteEndpoint).updateNote(
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
              (endpoints['note'] as _i4.NoteEndpoint).getNotes(session),
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
              (endpoints['profile'] as _i5.ProfileEndpoint).updateProfile(
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
              (endpoints['profile'] as _i5.ProfileEndpoint).getProfile(session),
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
            'trade': _i1.ParameterDescription(
              name: 'trade',
              type: _i1.getType<_i11.Trade>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trade'] as _i6.TradeEndpoint).addTrade(
            session,
            params['trade'],
          ),
        ),
        'deleteTrade': _i1.MethodConnector(
          name: 'deleteTrade',
          params: {
            'trade': _i1.ParameterDescription(
              name: 'trade',
              type: _i1.getType<_i11.Trade>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trade'] as _i6.TradeEndpoint).deleteTrade(
            session,
            params['trade'],
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
              (endpoints['tradeLocker'] as _i7.TradeLockerEndpoint)
                  .initializeClient(
            session,
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
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i7.TradeLockerEndpoint)
                  .authenticate(
            session,
            params['email'],
            params['password'],
            params['server'],
          ),
        ),
        'refresh': _i1.MethodConnector(
          name: 'refresh',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tradeLocker'] as _i7.TradeLockerEndpoint)
                  .refresh(session),
        ),
        'getTrades': _i1.MethodConnector(
          name: 'getTrades',
          params: {
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
              (endpoints['tradeLocker'] as _i7.TradeLockerEndpoint).getTrades(
            session,
            params['accountId'],
            params['accNum'],
          ),
        ),
        'getPositionsWithRateLimit': _i1.MethodConnector(
          name: 'getPositionsWithRateLimit',
          params: {
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
              (endpoints['tradeLocker'] as _i7.TradeLockerEndpoint)
                  .getPositionsWithRateLimit(
            session,
            params['accountId'],
            params['accNum'],
          ),
        ),
        'getOrdersHistoryWithRateLimit': _i1.MethodConnector(
          name: 'getOrdersHistoryWithRateLimit',
          params: {
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
              (endpoints['tradeLocker'] as _i7.TradeLockerEndpoint)
                  .getOrdersHistoryWithRateLimit(
            session,
            params['accountId'],
            params['accNum'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i12.Endpoints()..initializeEndpoints(server);
  }
}
