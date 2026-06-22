import 'package:get/get.dart';

import 'package:websocket/middlewares/auth_middleware.dart';
import 'package:websocket/views/address/address_screen/address_screen.dart';
import 'package:websocket/views/auth/auth_screens/create_account.dart';
import 'package:websocket/views/auth/auth_screens/login_screen.dart';
import 'package:websocket/views/auth/auth_screens/verification.dart';
import 'package:websocket/views/control_panel/control_panel_screen.dart';

import 'package:websocket/views/home/home_screen/home_screen.dart';
import 'package:websocket/views/cart/cart_screen/cart.dart';
import 'package:websocket/views/notifications/notifications_screen/notifications_screen.dart';
import 'package:websocket/views/payment/payment_screen/payment_screen.dart';
import 'package:websocket/views/product_details/product_details_controller/product_details_controller.dart';
import 'package:websocket/views/product_details/product_details_screen/product_details.dart';
import 'package:websocket/views/search/search_screen/search_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => ProductDetailsScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProductDetailsController());
      }),
    ),
    GetPage(name: AppRoutes.cart, page: () => CartScreen()),
    GetPage(name: AppRoutes.search, page: () => SearchScreen()),
    GetPage(name: AppRoutes.createAccount, page: () => CreateAccountScreen()),
    GetPage(name: AppRoutes.payment, page: () => PaymentScreen()),
    GetPage(name: AppRoutes.address, page: () => AddressScreen()),
    GetPage(name: AppRoutes.verification, page: () => VerificationScreen()),
    GetPage(name: AppRoutes.controlPanel, page: () => ControlPanelScreen()),
    GetPage(name: AppRoutes.notifications, page: () => NotificationsScreen())
  ];
}
