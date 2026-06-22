import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:websocket/core/classes/check_internet.dart';

class Crud {
  Future<dynamic> get(String url) async {
    try {
      print("GET START");
      if (!await checkInternet()) {
        throw Exception("No Internet Connection");
      }

      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }

  Future<dynamic> post(String url, Map data) async {
    try {
      if (!await checkInternet()) {
        throw Exception("No Internet Connection");
      }
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {'Content-Type': "application/json"},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Post Failed");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }
}
