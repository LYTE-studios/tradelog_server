import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';

class NetworkTradelyException implements Exception {
  final Response networkResponse;

  NetworkTradelyException(
    this.networkResponse,
  ) {
    Sentry.captureException(
      {
        "url": networkResponse.realUri.toString(),
        "status": networkResponse.statusCode,
        "message": networkResponse.statusMessage,
        "data": networkResponse.data,
      },
    );
  }
}
