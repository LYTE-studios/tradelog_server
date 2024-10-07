import 'package:sentry/sentry.dart';
import 'package:tradelog_server/server.dart';

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) async {
  await Sentry.init((options) {
    options.dsn =
        'https://bff1f7d2e66af31a22585aa34a756c1d@o4506789659475968.ingest.us.sentry.io/4508081693982720';
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
    // We recommend adjusting this value in production.
    options.tracesSampleRate = 1.0;
  });

  run(args);
}
