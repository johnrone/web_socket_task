import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:websocket/core/services/local_notification.dart';
import 'package:websocket/firebase_options.dart';

class PushNotificationService extends GetxService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<PushNotificationService> init() async {
    if (kIsWeb) return this;
    await _requestPermission();
    await LocalNotificationService.init();

    await _getToken();
    FirebaseMessaging.onBackgroundMessage(handleBGMessage);
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.showNotification(message);
    });
    return this;
  }

  Future<void> _requestPermission() async {
    await messaging.requestPermission();
  }

  Future<void> _getToken() async {
    String? fcmToken = await messaging.getToken();
    print('tokennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
    log(fcmToken ?? 'null');
  }
}

Future<void> handleBGMessage(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  log(message.notification?.title ?? 'null');
}
