import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/endpoints/tradelocker_endpoint.dart';

// Future calls are calls that will be invoked at a later time. An example is if
// you want to send a drip-email campaign after a user signs up. You can
// schedule a future call for a day, a week, or a month. The calls are stored in
// the database, so they will persist even if the server is restarted.
//
//  To add a future call to your server, you need to register it in the
//  `server.dart` file. Schedule the call using the
//  `session.serverpod.futureCallWithDelay` or `session.serverpod.futureCallAtTime`
//  methods. You can optionally pass a serializable object together with the
//  call.

// class GetTradesCall extends FutureCall {
//   // @override
//   // Future<void> invoke(Session session, SerializableModel? object) async {
//   //    // Cast the SerializableModel to a map or any object type you passed
//   //   var data = object as Map<String, dynamic>;

//   //   int accountId = data['accountId'];
//   //   int accNum = data['accNum'];

//   //   // Fetch the trades
//   //   var trades = await session.server.endpoints.connectors.
//   // }
// }
