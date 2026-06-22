import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:websocket/core/constants/app_keys.dart';

class NotificationSender {


  static Future<void> sendNotificationToSelectToken({
    required String fcmToken,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    if (fcmToken.trim().isEmpty) {
      throw ArgumentError('fcmToken is empty');
    }
    final serviceAccount = jsonDecode(AppKeys.servicesData) as Map<String, dynamic>;
    final credentials = auth.ServiceAccountCredentials.fromJson(serviceAccount);
    final client = await auth.clientViaServiceAccount(credentials, [
      'https://www.googleapis.com/auth/firebase.messaging',
    ]);


    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('notifications')
            .doc(user.uid)
            .collection('notifications')
            .doc()
            .set({
          'title': title,
          'message': body,
          'createdAt': Timestamp.now()
        });
      }
      final response = await client.post(
        Uri.parse(
          'https://fcm.googleapis.com/v1/projects/${AppKeys.projectId}/messages:send',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'message': {
            'token': fcmToken.trim(),
            'notification': {'title': title, 'body': body},
            'data': data,
            'android': {
              'priority': 'high',
              'notification': {'sound': 'default'},
            },
          },
        }),
      );
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('sorry could not send a notification');
      }
    } finally {
      client.close();
    }
  }

}
