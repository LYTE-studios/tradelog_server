import 'dart:async';
import 'dart:collection';

import 'package:dio/dio.dart';

class RequestQueue {
  final Queue<EndpointRequest> _queue = Queue();
  bool _isProcessing = false;
  final int maxRequestsPerSecond;
  final Duration delayBetweenRequests;

  RequestQueue({
    this.maxRequestsPerSecond = 2,
  }) : delayBetweenRequests = Duration(milliseconds: (1000 ~/ maxRequestsPerSecond));

  // Add a request to the queue
  void addRequest(EndpointRequest request) {
    _queue.add(request);
    _processQueue();
  }

  // Process the queue
  Future<void> _processQueue() async {
    if (_isProcessing || _queue.isEmpty) return;

    _isProcessing = true;

    while (_queue.isNotEmpty) {
      final EndpointRequest request = _queue.removeFirst();
      
      // Process the main request and its sub-requests
      await _processRequest(request);

      // Wait to respect the 2 requests per second limit before moving to the next one
      await Future.delayed(delayBetweenRequests);
    }

    _isProcessing = false;
  }

  // Process a request with its sub-requests
  Future<void> _processRequest(EndpointRequest request) async {
    try {
      await _handleRequestWithRateLimit(request); // Process the request
    } catch (e) {
      throw Exception('Error processing request: $e');
    }
  }

  // Handle a single request with rate-limit and retry logic
  Future<void> _handleRequestWithRateLimit(EndpointRequest request) async {
    bool requestSuccessful = false;
    while (!requestSuccessful) {
      try {
        await Future.delayed(delayBetweenRequests); // Wait before making the request
        await request.request(); // Try to make the request
        requestSuccessful = true; // If successful, exit the loop
      } on DioError catch (e) {
        // Check if it's a 429 Too Many Requests error
        if (e.response?.statusCode == 429) {
          print('Received 429 Too Many Requests');

          // Extract the Retry-After header if present
          final retryAfter = e.response?.headers.value('Retry-After');
          if (retryAfter != null) {
            await Future.delayed(delayBetweenRequests); // Wait before retrying
          } else {
            // Default retry delay (5 seconds) if no Retry-After header is provided
            print('Retrying after default 5 seconds');
            await Future.delayed(delayBetweenRequests);
          }
        } else {
          // If it's not a rate-limiting error, rethrow it
          print('Non-rate-limit error: $e');
          rethrow;
        }
      }
    }
  }
}

class EndpointRequest {
  final int priority;
  final Future<void> Function() request;

  EndpointRequest({
    required this.priority,
    required this.request,
  });
}
