import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/services/storage_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final storage = Get.find<StorageService>();
    if (storage.isLoggedIn) {
      return RouteSettings(name: AppRoutes.home);
    }
    return null;
  }
}
