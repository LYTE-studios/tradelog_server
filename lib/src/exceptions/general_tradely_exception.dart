import 'package:sentry/sentry.dart';

class GeneralTradelyException implements Exception {
  final String message;

  GeneralTradelyException(
    this.message,
  ) {
    Sentry.captureException(
      this,
      hint: Hint.withMap(
        {
          "message": message,
        },
      ),
    );
  }
}
