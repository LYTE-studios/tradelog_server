import 'dart:math';

import 'package:dio/dio.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:tradelog_server/src/endpoints/global_endpoint.dart';
import 'package:tradelog_server/src/exceptions/general_tradely_exception.dart';
import 'package:tradelog_server/src/exceptions/network_tradely_exception.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/configuration.dart';

class MetaApiClient {
  final Dio _dio;

  final Session session;

  static const String accountUrl = UrlConfiguration.metaApiAccountManagement;

  MetaApiClient(this.session)
      : _dio = Dio(
          BaseOptions(
            headers: {
              'auth-token': session.passwords['metaApiKey'],
              'Content-Type': 'application/json',
            },
          ),
        );

  Future<LinkedAccount?> authenticate({
    required MetaApiAuthenticationDto authDto,
  }) async {
    const String endpoint = '/users/current/accounts';

    final AuthenticationInfo? userInfo = await session.authenticated;

    if (userInfo == null) {
      throw GeneralTradelyException('User is not authenticated');
    }

    Platform platform =
        authDto.platform.toLowerCase() == 'mt4' ? Platform.mt4 : Platform.mt5;

    Response response = await _post(
      accountUrl + endpoint,
      authDto.toJson(),
    );

    // Expecting a 201 created response
    if (response.statusCode != 201) {
      throw NetworkTradelyException(response);
    }

    MetaApiAuthenticationResponseDto authResponseDto =
        MetaApiAuthenticationResponseDto.fromJson(
      response.data,
    );

    Map<String, String> accountInformation = {
      'accountId': authResponseDto.id,
      'state': authResponseDto.state,
    };

    LinkedAccount account = LinkedAccount(
      userInfoId: userInfo.userId,
      platform: platform,
      accountInformation: accountInformation,
    );

    account = await LinkedAccount.db.insertRow(session, account);

    GlobalEndpoint().refreshCaches(session);

    return account;
  }

  Future<void> deleteAccount(Session session, LinkedAccount account) async {
    String? accountId = account.accountInformation['accountId'];

    // Whatever happens, the account should be deleted.
    await LinkedAccount.db.deleteRow(session, account);

    if (accountId == null) {
      throw GeneralTradelyException('Account ID not found');
    }

    final String endpoint = '/users/current/accounts/$accountId';

    Response response = await _delete(endpoint);

    if (response.statusCode != 204) {
      throw NetworkTradelyException(response);
    }
  }

  // -- PRIVATE --

  Future<Response> _get(String endpoint) async {
    return await _dio.get(endpoint);
  }

  Future<Response> _post(String endpoint, Map<String, dynamic> data) async {
    return await _dio.post(endpoint, data: data);
  }

  Future<Response> _delete(String endpoint) async {
    return await _dio.delete(endpoint);
  }
}
