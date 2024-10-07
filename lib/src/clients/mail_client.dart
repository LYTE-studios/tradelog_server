import 'package:dio/dio.dart';

class MailClient {
  final Dio _dio;
  static const String myEmail = 'bogdan@lytestudios.be';
  // static Map<String, int> verificationTemplates = {
  //   'en': 6209328,
  //   'nl': 6310271,
  // };

  MailClient(String apiKey, String secretKey)
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://$apiKey:$secretKey@api.mailjet.com/v3.1',
          headers: {
            'Content-Type': 'application/json',
          },
        ));

  Future<bool> sendVerificationEmail(
    String email,
    String verificationCode,
  ) async {
    final emailData = {
      'Messages': [
        {
          'From': {
            'Email': myEmail,
            'Name': 'Tradely',
          },
          'To': [
            {
              'Email': email,
            }
          ],
          'Subject': 'Your verification code for tradely',
          'TextPart': 'Your verification code is $verificationCode',
          'HTMLPart': '<h3>Your verification code is $verificationCode</h3>',
        }
      ]
    };
    try {
      await _dio.post('/send', data: emailData);
    } on Exception catch (_) {
      return false;
      // if (e is DioException) {
      //   if (e.response?.statusCode == 500) {
      //     throw Exception('Internal server error: ${e.response?.data}');
      //   } else {
      //     throw Exception('Failed to authenticate: ${e.message}');
      //   }
      // } else {
      //   throw Exception('Unexpected error: $e');
      // }
    }
    return true;
  }

  Future<bool> sendPasswordResetEmail(
    String email,
    String resetCode,
  ) async {
    final emailData = {
      'Messages': [
        {
          'From': {
            'Email': myEmail,
            'Name': 'Tradely',
          },
          'To': [
            {
              'Email': email,
            }
          ],
          'Subject': 'Your password reset code for tradely',
          'TextPart': 'Your password reset code is $resetCode',
          'HTMLPart': '<h3>Your password reset code is $resetCode</h3>',
        }
      ]
    };
    try {
      await _dio.post('/send', data: emailData);
    } on Exception catch (_) {
      return false;
    }
    return true;
  }
}