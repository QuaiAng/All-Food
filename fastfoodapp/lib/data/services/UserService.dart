import 'dart:convert';

import 'package:fastfoodapp/data/models/UserModel.dart';
import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String, dynamic> requestBody = {
      "username": username,
      "password": password,
    };

    final response = await http.post(
      Uri.parse("${AppStrings.urlAPI}/user/login"),
      headers: {
        "Content-Type":
            "application/json", // Tiêu đề yêu cầu (tuỳ chỉnh nếu cần)
      },
      body: jsonEncode(requestBody), // Chuyển đổi dữ liệu sang dạng JSON
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> token = jsonDecode(response.body);
      return token;
    } else if (response.statusCode == 404) {
      throw Exception("Not Found");
    } else {
      throw Exception("Has error");
    }
  }

  Future<bool> register(Usermodel user) async {
    Map<String, dynamic> requestBody = {
      "username": user.userName,
      "password": user.password,
      "fullName": user.fullName,
      "email": user.email,
      "phone": user.phone,
    };

    final response = await http.post(
      Uri.parse("${AppStrings.urlAPI}/user/add"),
      headers: {
        "Content-Type":
            "application/json", // Tiêu đề yêu cầu (tuỳ chỉnh nếu cần)
      },
      body: jsonEncode(requestBody), // Chuyển đổi dữ liệu sang dạng JSON
    );

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      print(data['message']);
      throw Exception(data['message']);
    } else {
      var data = jsonDecode(response.body);
      print(data['message']);
      throw Exception(data['message']);
    }
  }
}
