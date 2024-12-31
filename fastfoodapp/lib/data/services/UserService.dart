import 'dart:convert';

import 'package:fastfoodapp/data/models/UserModel.dart';
import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class UserService {
  // Biến static để giữ thể hiện duy nhất của singleton
  static final UserService _instance = UserService._internal();

  // Factory constructor trả về thể hiện duy nhất
  factory UserService() {
    return _instance;
  }

  // Constructor nội bộ (chỉ được sử dụng bên trong lớp này)
  UserService._internal();

  Future<String> login(String username, String password) async {
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
      return token['token'];
    } else if (response.statusCode == 404) {
      return "";
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

    if (response.statusCode == 201) {
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
