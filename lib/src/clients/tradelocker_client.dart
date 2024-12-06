import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/endpoints/tradelocker_endpoint.dart';
import 'package:tradelog_server/src/exceptions/general_tradely_exception.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/request_queue.dart';

class TradeLockerClient {
  Dio _dio;

  RequestQueue queue = RequestQueue(maxRequestsPerSecond: 5);

  final String baseUrl;

  String apiKey;

  String refreshToken;

  TradeLockerClient(
    this.baseUrl, {
    required this.apiKey,
    required this.refreshToken,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            validateStatus: (status) => true,
            headers: {
              'Authorization': 'Bearer $apiKey',
              'Content-Type': 'application/json',
            },
          ),
        );

  Future<void> _checkTokenValidity(Session session) async {
    if (apiKey.isEmpty) {
      return;
    }

    try {
      final jwt = JWT.decode(apiKey);
      final expiry = jwt.payload['exp'];

      if (expiry == null) {
        throw Exception('Token has no expiry');
      }

      final expirationDate = DateTime.fromMillisecondsSinceEpoch(expiry * 1000);

      if (DateTime.now().isAfter(expirationDate)) {
        // LinkedAccount account = await TradeLockerEndpoint().refresh(
        //   session,
        //   apiKey: apiKey,
        // );

        // apiKey = account.apiKey;

        _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            validateStatus: (status) => true,
            headers: {
              'Authorization': 'Bearer $apiKey',
              'Content-Type': 'application/json',
            },
          ),
        );
      }
    } catch (e) {
      throw Exception('Error decoding token: $e');
    }
  }

  Future<void> _checkRefreshValidity(Session session) async {
    if (refreshToken.isEmpty) {
      return;
    }

    try {
      final jwt = JWT.decode(refreshToken);
      final expiry = jwt.payload['exp'];

      if (expiry == null) {
        throw Exception('Token has no expiry');
      }

      final expirationDate = DateTime.fromMillisecondsSinceEpoch(expiry * 1000);

      if (DateTime.now().isAfter(expirationDate)) {
        // LinkedAccount account =
        //     await TradeLockerEndpoint().reauthenticateAccount(
        //   session,
        //   apiKey,
        // );

        // apiKey = account.apiKey;
        // refreshToken = account.refreshToken;
      }
    } catch (e) {
      throw Exception('Error decoding refreshToken: $e');
    }
  }

  Future<Response> get(
    Session session,
    String endpoint, {
    int? accNum,
    Map<String, dynamic>? extraHeaders,
  }) async {
    await _checkRefreshValidity(session);

    await _checkTokenValidity(session);

    Map<String, dynamic> extraHeaders = {};

    if (accNum != null) {
      extraHeaders["accNum"] = accNum;
    }

    Completer getFuture = Completer<Response>();

    queue.addRequest(
      EndpointRequest(
        priority: 1,
        request: () async {
          int retries = 0;

          Future<Response> performGet() async {
            return await _dio.get(
              endpoint,
              options: Options(
                headers: {
                  ..._dio.options.headers,
                  ...extraHeaders,
                },
              ),
            );
          }

          Future<Response> makeRequest() async {
            try {
              Response response = await performGet();
              if (response.statusCode == 429) {
                // If the client has already tried twice, return the faulty response
                if (retries > 2) {
                  return response;
                }

                retries += 1;

                await Future.delayed(Duration(milliseconds: 500));

                return makeRequest();
              }

              return response;
            } catch (e) {
              throw GeneralTradelyException(
                'Something went wrong while processing request: ${e.toString()}',
              );
            }
          }

          try {
            Response response = await makeRequest();
            getFuture.complete(response);
          } catch (e) {
            getFuture.completeError(e);
          }
        },
      ),
    );

    return await getFuture.future;
  }

  Future<Response> post(
    Session session,
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    await _checkRefreshValidity(session);

    await _checkTokenValidity(session);

    Completer getFuture = Completer<Response>();

    queue.addRequest(
      EndpointRequest(
        priority: 1,
        request: () async {
          int retries = 0;

          Future<Response> performPost() async {
            return await _dio.post(endpoint, data: data);
          }

          Future<Response> makeRequest() async {
            try {
              Response response = await performPost();

              if (response.statusCode == 429) {
                // If the client has already tried twice, return the faulty response
                if (retries > 3) {
                  return response;
                }

                retries += 1;

                await Future.delayed(Duration(milliseconds: 500));

                return makeRequest();
              }

              return response;
            } catch (e) {
              throw GeneralTradelyException(
                'Something went wrong while processing request: ${e.toString()}',
              );
            }
          }

          try {
            Response response = await makeRequest();
            getFuture.complete(response);
          } catch (e) {
            getFuture.completeError(e);
          }
        },
      ),
    );

    return await getFuture.future;
  }
}
