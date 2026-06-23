


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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => PushNotificationService().init());
    
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
 String ? token = Get.find<StorageService>().getToken();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: AppBinding(),
          // home: AddressScreen(),
          initialRoute:AppRoutes.login,
          //  token !=null ? AppRoutes.home : AppRoutes.login,
          getPages: AppPages.pages,
        );
      },
    );
  }
}

