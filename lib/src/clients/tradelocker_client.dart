import 'package:dio/dio.dart';

class TradeLockerClient {
  final Dio _dio;

  TradeLockerClient(String baseUrl, String apiKey, {String accNum = ''})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
            'accNum': accNum,
          },
        ));

  Future<Response> get(String endpoint) async {
    return await _dio.get(endpoint);
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    return await _dio.post(endpoint, data: data);
  }

  // Add other HTTP methods (PUT, DELETE) if needed
}