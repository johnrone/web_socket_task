import 'dart:developer';

import 'package:get/get.dart';
import 'package:websocket/core/services/security_service.dart';
import 'package:websocket/views/cart/cart_controller/cart_controller.dart';
import 'package:websocket/models/cart_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:websocket/core/services/notification_sender.dart';

class PaymentController extends GetxController {
  final CartController cartController = Get.find();
  var isLoading = false.obs;

  List<CartItem> getSelectedItems() {
    return cartController.cartItems
        .where((item) => cartController.selectedItems.contains(item.product.id))
        .toList();

  }

  double calculateTotalPrice() {
    double total = 0;

    for (var item in getSelectedItems()) {
      total += item.product.price * item.quantity;
    }

    return total;
  }

  Future<void> makePayment() async {


    try {

      isLoading.value = true;

      bool rooted = await SecurityService.isDeviceRooted();
      log("Root Check Result =============================================================== $rooted");
      if (rooted) {
        Get.snackbar(
          'Security Error',
          'Payment blocked. Rooted device detected.',
        );

        return;
      }

      await Future.delayed(Duration(seconds: 2));

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Get.snackbar('Error', 'User not logged in');
        return;
      }
      String uid = user.uid;

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      String token = userDoc['token'];


      await NotificationSender.sendNotificationToSelectToken(
        fcmToken: token,

        title: 'Payment Success',

        body: 'Your payment completed successfully  ',
      );

      Get.snackbar('Success', 'Payment completed');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Payment failed');
    } finally {
      isLoading.value = false;
    }
  }
}
