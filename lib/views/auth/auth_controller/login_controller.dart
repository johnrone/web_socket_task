
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_routes.dart';

import 'package:websocket/core/services/storage_service.dart';


class LoginController extends GetxController {
  // Crud crud = Crud();
  final storage = Get.find<StorageService>();
  var isLoading = false.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // Future<bool> login(String email, String password) async {
  //   try {
  //     isLoading.value = true;
  //     final data = await crud.post(ApiLinks.login, {
  //       'email': email,
  //       'password': password,
  //     });
  //     await storage.saveToken(data['access_token']);
  //     return true;
  //   } catch (e) {
  //     print("Login error: $e");
  //     return false;
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  void loginWithValid() async {
    if (!formKey.currentState!.validate()) return;

    // bool success = await login(
    //   emailController.text,
    //   passwordController.text,
    // );

    // if (success) {
    //   Get.offNamed(AppRoutes.home);
    // } else {
    //   Get.snackbar(
    //     'Login Error',
    //     'Please check your Email and Password',
    //     snackPosition: SnackPosition.BOTTOM,
    //     colorText: AppColors.primary,
    //   );
    // }
    try {
      isLoading.value = true;

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),

        password: passwordController.text.trim(),
      );

      String? token = await FirebaseMessaging.instance.getToken();
storage.saveToken(token ?? '');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .update({'token': token});

      Get.offNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Login Error',
        e.message ?? '',
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColors.primary,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();

    passwordController.dispose();
    super.onClose();
  }
}
