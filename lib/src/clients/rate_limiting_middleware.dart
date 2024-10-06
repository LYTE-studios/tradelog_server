// import 'package:serverpod/serverpod.dart';;
// import 'dart:convert';

// class RateLimitingMiddleware extends Endpoint {
//   static const String globalRequestCountKey = 'global_request_count';
//   static const int maxRequestsPerSecond = 2;
//   static const String requestQueueKey = 'request_queue';

//   @override
//   Future<void> handle(Session session, MethodCall call) async {
//     final redis = session.serverpod.redis;
    
//     // Get the current request count
//     int requestCount = await redis.incr(globalRequestCountKey);

//     // If the rate limit is exceeded, enqueue the request
//     if (requestCount > maxRequestsPerSecond) {
//       session.log('Rate limit exceeded, queuing request');
      
//       // Serialize the request (you can store the necessary information about the request)
//       String serializedRequest = jsonEncode({
//         'endpoint': call.endpoint,
//         'arguments': call.arguments,
//         'sessionId': session.id,
//       });

//       // Push the request to the Redis queue
//       await redis.lpush(requestQueueKey, serializedRequest);

//       // Send an acknowledgment to the client
//       session.sendString('Request queued due to rate limiting. It will be processed shortly.');
      
//       // Set expiration for the request count (to reset every second)
//       await redis.expire(globalRequestCountKey, 1);
//     } else {
//       // Proceed with the request if within the rate limit
//       await super.handle(session, call);

//       // Set expiration for the request count
//       await redis.expire(globalRequestCountKey, 1);
//     }
//   }
// }
