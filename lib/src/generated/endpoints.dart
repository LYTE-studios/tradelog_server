/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/account_endpoint.dart' as _i2;
import 'package:tradelog_server/src/generated/linked_accounts.dart' as _i3;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'account': _i2.AccountEndpoint()
        ..initialize(
          server,
          'account',
          null,
        )
    };
    connectors['account'] = _i1.EndpointConnector(
      name: 'account',
      endpoint: endpoints['account']!,
      methodConnectors: {
        'linkAccount': _i1.MethodConnector(
          name: 'linkAccount',
          params: {
            'account': _i1.ParameterDescription(
              name: 'account',
              type: _i1.getType<_i3.LinkedAccount>(),
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
              type: _i1.getType<_i3.LinkedAccount>(),
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
    modules['serverpod_auth'] = _i4.Endpoints()..initializeEndpoints(server);
  }
}
