import 'package:flutter/foundation.dart';
import 'dart:io' as io;

Future<bool> checkInternet() async {
  if (kIsWeb) {
    return true; 
  }
  try {
    final result = await io.InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (e) {
    print('error $e');
    return false;
  }
  return false;
}
