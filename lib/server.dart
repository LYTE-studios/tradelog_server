import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:serverpod_cloud_storage_s3/serverpod_cloud_storage_s3.dart'
    as s3;
import 'package:tradelog_server/src/clients/mail_client.dart';
import 'package:tradelog_server/src/endpoints/tradelocker_endpoint.dart';
import 'package:tradelog_server/src/util/request_queue.dart';
import 'package:tradelog_server/src/web/routes/root.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

// TODO
// - Fix the token refresh system
// - Add calls for necessary Statistics functionality
// - Fix the trade fetch calls and manage the cache  DONE
// - Test on platform

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // Configuration for sign in with email.
  auth.AuthConfig.set(
    auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        final mailClient = MailClient(
          session.serverpod.getPassword('mailjetApiKey')!,
          session.serverpod.getPassword('mailjetSecretKey')!,
        );

        return mailClient.sendVerificationEmail(email, validationCode);
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        final mailClient = MailClient(
          session.serverpod.getPassword('mailjetApiKey')!,
          session.serverpod.getPassword('mailjetSecretKey')!,
        );

        return mailClient.sendPasswordResetEmail(
            userInfo.email!, validationCode);
      },
    ),
  );

  final RequestQueue tradelockerRequestQueue =
      RequestQueue(maxRequestsPerSecond: 2);
  TradeLockerEndpoint.requestQueue = tradelockerRequestQueue;
  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  pod.webServer.addRoute(auth.RouteGoogleSignIn(), '/googlesignin');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );
  pod.addCloudStorage(
    s3.S3CloudStorage(
      serverpod: pod,
      storageId: 'public',
      public: true,
      region: 'us-east-1',
      bucket: 'tradely',
      publicHost: 'storage.tradely.lytestudios.be',
    ),
  );

  // Start the server.
  await pod.start();
}
