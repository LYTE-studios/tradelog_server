import 'package:dio/dio.dart';

class MetaApiClient {
  final Dio _dio;

  MetaApiClient(String baseUrl, String apiKey)
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'auth-token': '$apiKey',
            'Content-Type': 'application/json',
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