


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:websocket/bindings/init_bindings.dart';
import 'package:websocket/core/constants/app_pages.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/services/notification_service.dart';
import 'package:websocket/core/services/storage_service.dart';

import 'package:firebase_core/firebase_core.dart';


import 'firebase_options.dart';

void main() async {
  print("App starting...");
  WidgetsFlutterBinding.ensureInitialized();

  try {

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  } catch (e) {
    print("Firebase initialization failed: $e");
  }

  try {

    await Get.putAsync(() => StorageService().init());

  } catch (e) {
    print("StorageService initialization failed: $e");
  }

  try {

    await Get.putAsync(() => PushNotificationService().init());
    } catch (e) {
    print("PushNotificationService initialization failed: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String? token;
    try {
      token = Get.find<StorageService>().getToken();
    } catch (e) {
      print("Error finding StorageService: $e");
    }

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: AppBinding(),
          initialRoute: token != null ? AppRoutes.home : AppRoutes.login,
          getPages: AppPages.pages,
        );
      },
    );
  }
}

