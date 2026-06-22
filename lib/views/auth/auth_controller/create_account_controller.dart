
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket/core/classes/check_internet.dart';

import 'package:websocket/core/constants/app_routes.dart';

import 'package:websocket/core/services/sqflite_services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
class CreateAccountController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    if (!kIsWeb) {
      loadOfflineData();
      syncOfflineData();
    }
  }

  var isLoading = false.obs;
  var storeLicensePath = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final commercialNameController = TextEditingController();
  final commercialAccountController = TextEditingController();
  final SqfliteService sqfliteService = SqfliteService();
  final ImagePicker picker = ImagePicker();
  Future<void> createAccountByFirebase() async {
    if (!formKey.currentState!.validate()) return;
    if (storeLicensePath.value.isEmpty) {
      Get.snackbar("Error", "Please select store license image");
      return;
    }
    isLoading.value = true;

    bool hasInternet = await checkInternet();
    try {
      if (hasInternet) {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        String? token = await FirebaseMessaging.instance.getToken();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'uid': credential.user!.uid,
          'email': emailController.text.trim(),
          'userName': userNameController.text.trim(),
          'commercialName': commercialNameController.text.trim(),
          'commercialAccount': commercialAccountController.text.trim(),
          'token': token ?? '',
        });

        Get.offNamed(AppRoutes.verification);
      } else {
        if (kIsWeb) {
          Get.snackbar(
            "Offline Unsupported",
            "Offline account saving is not supported on web.",
          );
          return;
        }

        bool exists = await isUserExist();
        print('================================ $exists');

        if (exists) {
          int result = await sqfliteService.updateData('''
UPDATE users SET
userName = "${userNameController.text}",
email = "${emailController.text}",
password = "${passwordController.text}",
commercialName = "${commercialNameController.text}",
commercialAccount = "${commercialAccountController.text}",
storeLicense = "${storeLicensePath.value}"

''');
          print('==================$result');
        } else {
          await sqfliteService.insertData('''
INSERT INTO users(
userName,
email,
password,
commercialName,
commercialAccount,
storeLicense
)
VALUES(
"${userNameController.text}",
"${emailController.text}",
"${passwordController.text}",
"${commercialNameController.text}",
"${commercialAccountController.text}",
"${storeLicensePath.value}"
)
''');
        }

        Get.snackbar(
          "Offline Mode",
          "Data saved locally, when you will have internet your account will register and you can enter by Login screen",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "Email already exists");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadOfflineData() async {
    if (kIsWeb) return;

    var data = await sqfliteService.readData("SELECT * FROM users LIMIT 1");
    print('==============$data');
    if (data.isNotEmpty) {
      var user = data.first;

      userNameController.text = user['userName'] ?? '';
      emailController.text = user['email'] ?? '';
      passwordController.text = user['password'] ?? '';
      commercialNameController.text = user['commercialName'] ?? '';
      commercialAccountController.text = user['commercialAccount'] ?? '';
      storeLicensePath.value = user['storeLicense'] ?? '';
    }
  }

  Future<bool> isUserExist() async {
    if (kIsWeb) return false;

    var data = await sqfliteService.readData("SELECT * FROM users LIMIT 1");

    return data.isNotEmpty;
  }

  Future<void> pickStoreLicense(ImageSource source,) async {
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      storeLicensePath.value = image.path;

      Get.snackbar("Success", "Image Selected Successfully");
    }
  }

  Future<void> syncOfflineData() async {
    if (kIsWeb) return;

    bool hasInternet = await checkInternet();

    if (!hasInternet) return;

    var data = await sqfliteService.readData("SELECT * FROM users LIMIT 1");

    if (data.isEmpty) return;

    var user = data.first;

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: user['email'],
        password: user['password'],
      );

      String? token = await FirebaseMessaging.instance.getToken();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'uid': credential.user!.uid,

        'email': user['email'],

        'userName': user['userName'],

        'commercialName': user['commercialName'],

        'commercialAccount': user['commercialAccount'],

        'storeLicense': user['storeLicense'],

        'token': token ?? '',
      });

      await sqfliteService.deleteData("DELETE FROM users");
      userNameController.clear();
      emailController.clear();
      passwordController.clear();
      commercialNameController.clear();
      commercialAccountController.clear();
      storeLicensePath.value = '';
      Get.snackbar(
        "Success",
        "Offline data synced and your account is ready to use",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        await sqfliteService.deleteData("DELETE FROM users");

        Get.snackbar("Info", "User already exists");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    commercialAccountController.dispose();
    commercialNameController.dispose();
    super.onClose();
  }
}