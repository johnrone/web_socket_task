import 'package:flutter/services.dart';

class SecurityService {
  static const MethodChannel _channel =
      MethodChannel('com.example.websocket/device_security');

  static Future<bool> isDeviceRooted() async {
    try {
      final bool result =
          await _channel.invokeMethod('checkRoot');

      return result;
    } catch (e) {
      return true;
    }
  }
}