import 'dart:async';
import 'dart:convert';

import 'package:fastfoodapp/data/models/Address.dart';
import 'package:fastfoodapp/res/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Addressservice {
  Future<List<dynamic>?> getAddress() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final response = await http.get(Uri.parse(
<<<<<<< HEAD
        "${AppStrings.urlAPI}/address/userId=${_prefs.getInt('userId')}"));
=======
        "https://localhost:7024/api/address/userId=${_prefs.getInt('userId')}"));
>>>>>>> origin/BranchOfNguyen

    if (response.statusCode == 200) {
      // return jsonDecode(response.body)[
      //     0]; // trả ra một list bên trong nó là các map địa chỉ, mà mỗi đại chỉ có kiểu dữ liệu là map theo dạng key = value.
      return jsonDecode(response.body)['data'];
    } else if (response.statusCode == 400) {
      return null;
    } else if (response.statusCode == 404) {
      return throw Exception("Not Found Data");
    }
  }

  Future<Map<String, dynamic>?> getAddressById(int addressId) async {
    final response = await http
        .get(Uri.parse("${AppStrings.urlAPI}/address/addressId=${addressId}"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 404) {
      var data = jsonDecode(response.body);
      return data;
    }
  }

  Future<Map<String, dynamic>?> deleteAddressById(int addressId) async {
    final response = await http
        .delete(Uri.parse("${AppStrings.urlAPI}/address/remove/${addressId}"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 404) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
