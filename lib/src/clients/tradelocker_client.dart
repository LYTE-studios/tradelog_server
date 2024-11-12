import 'package:dio/dio.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/endpoints/tradelocker_endpoint.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class TradeLockerClient {
  Dio _dio;

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
        LinkedAccount account =
            await TradeLockerEndpoint().refresh(session, apiKey: apiKey);

        apiKey = account.apiKey;

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
        throw Exception('Refresh token has expired');
        //await TradeLockerEndpoint().authenticate(session, email, password, server)
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

  Future<Response> post(
    Session session,
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    await _checkRefreshValidity(session);

    await _checkTokenValidity(session);

    return await _dio.post(endpoint, data: data);
  }
}
