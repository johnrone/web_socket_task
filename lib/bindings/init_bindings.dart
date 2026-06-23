import 'package:get/get.dart';
import 'package:websocket/controllers/price_controller.dart';
import 'package:websocket/core/services/web_socket_service.dart';
import 'package:websocket/views/auth/auth_controller/login_controller.dart';

import 'package:websocket/views/favorite/favorite_controller/favorite_controller.dart';
import 'package:websocket/views/cart/cart_controller/cart_controller.dart';

import 'package:websocket/views/auth/auth_controller/create_account_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( CartController(), permanent: true);
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => CreateAccountController(), fenix: true);
    Get.lazyPut(()=>LoginController(),fenix: true);
    Get.put( WebSocketService(), permanent: true).init();
    Get.lazyPut(() => PriceController(), fenix: true);
  }
}
