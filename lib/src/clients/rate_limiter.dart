import 'package:synchronized/synchronized.dart';

// Rate limiter class to limit the number of requests per second using the token bucket algorithm
class RateLimiter {
  final int maxRequestsPerSecond;
  int availableTokens;
  DateTime lastRefillTime;
  final _lock = Lock(); // Using a lock to ensure thread safety

  RateLimiter({required this.maxRequestsPerSecond})
      : availableTokens = maxRequestsPerSecond,
        lastRefillTime = DateTime.now();

  Future<void> waitForAvailability() async {
   // await _lock.synchronized(() async {
      refillTokens();

      if (availableTokens > 0) {
        availableTokens--;
      } else {
        // Wait until tokens are refilled
        await Future.delayed(Duration(seconds: 1));
        await waitForAvailability(); // Retry after delay
      }
    //});
  }

  void refillTokens() {
    var now = DateTime.now();
    var secondsPassed = now.difference(lastRefillTime).inSeconds;

    if (secondsPassed > 0) {
      availableTokens = maxRequestsPerSecond; // Refill tokens after 1 second
      lastRefillTime = now;
    }
  }
}