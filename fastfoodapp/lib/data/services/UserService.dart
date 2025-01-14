import 'dart:convert';
import 'package:fastfoodapp/data/models/UserModel.dart';
import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<Map<String, dynamic>> login(String username, String password) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> requestBody = {
      "username": username,
      "password": password,
    };

    final response = await http.post(
      Uri.parse("${AppStrings.urlAPI}/user/login"),
      headers: {
        "Content-Type": "application/json",
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

  Future<Map<String, dynamic>?> getUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse("${AppStrings.urlAPI}/user/${_prefs.getInt('userId')}"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'] as Map<String, dynamic>;
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      return throw Exception(data['title']);
    } else if (response.statusCode == 404) {
      var data = jsonDecode(response.body);
      return throw Exception(data['title']);
    }
  }

  Future<Map<String, dynamic>> getNameUserByUserId(int userId) async {
    final response = await http.get(
      Uri.parse("${AppStrings.urlAPI}/user/${userId}"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'] as Map<String, dynamic>;
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      return throw Exception(data['title']);
    } else {
      var data = jsonDecode(response.body);
      return throw Exception(data['title']);
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
    } else if (response.statusCode == 404) {
      var data = jsonDecode(response.body);
      print(data['message']);
      throw Exception(data['message']);
    } else {
      var data = jsonDecode(response.body);
      print(data['message']);
      throw Exception(data['message']);
    }
  }

  Future<Map<String, dynamic>> updateInfoUser(
      String name, String email, String phone, int userId) async {
    Map<String, dynamic> resquestBody = {
      "fullName": name,
      "email": email,
      "phone": phone,
      "imageUrl": "string"
    };
    final response = await http.put(
      Uri.parse("${AppStrings.urlAPI}/user/update/${userId}"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(resquestBody), // Chuyển đổi dữ liệu sang dạng JSON
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
