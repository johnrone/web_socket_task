import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late SharedPreferences prefs;

  String? token;

  Future<StorageService> init() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return this;
  }

  Future<void> saveToken(String tokenVal) async {
    await prefs.setString('token', tokenVal);
    token = tokenVal;
  }

  String? getToken() {
    return token;
  }

  Future<void> clearToken() async {
    await prefs.remove('token');
    token = null;
  }

  bool get isLoggedIn => token != null;
}