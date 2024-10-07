import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';

enum MailjetTemplates {
  emailVerification,
  passwordReset,
}

extension MailjetTemplatesExtension on MailjetTemplates {
  int getTemplateId() {
    switch (this) {
      case MailjetTemplates.emailVerification:
        return 000;
      case MailjetTemplates.passwordReset:
        return 000;
    }
  }
}

class MailClient {
  final Dio _dio;
  static const String myEmail = 'hello@tradely.io';

  MailClient(String apiKey, String secretKey)
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://$apiKey:$secretKey@api.mailjet.com/v3.1',
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

  /// Sends a mail with given template id and passed variable parameters
  Future<void> _sendTemplatedMail({
    required int templateId,
    required String receiverEmail,
    Map<String, dynamic>? variables,
  }) async {
    try {
      await _dio.post(
        '/send',
        data: {
          'Messages': [
            {
              "TemplateID": templateId,
              'From': {
                'Email': myEmail,
                'Name': 'Tradely',
              },
              'To': [
                {
                  'Email': receiverEmail,
                }
              ],
              "TemplateLanguage": true,
              "Variables": variables,
            }
          ]
        },
      );
    } on DioException catch (e) {
      // Log the exception
      Sentry.captureException(e);

      // Rethrow to notify parent functions
      rethrow;
    }
  }

  Future<bool> sendVerificationEmail(
    String email,
    String verificationCode,
  ) async {
    try {
      _sendTemplatedMail(
        // TODO: Set the template id
        templateId: 000,
        receiverEmail: email,
        variables: {
          'code': verificationCode,
        },
      );
    } catch (e) {
      // If anything goes wrong, report [false]
      return false;
    }

    return true;
  }

  Future<bool> sendPasswordResetEmail(
    String email,
    String resetCode,
  ) async {
    try {
      _sendTemplatedMail(
        // TODO: Set the template id
        templateId: 000,
        receiverEmail: email,
        variables: {
          'code': resetCode,
        },
      );
    } catch (e) {
      // If anything goes wrong, report [false]
      return false;
    }

    return true;
  }
}
