import 'dart:convert';

import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class Productservice {
  //Dưới này giao tiếp với API, chỉ có nhiệm vụ duy nhất đó, không kiểm tra, không convert data

  Future<List<dynamic>> SearchProductByName(String keyword) async {
    final response =
        await http.get(Uri.parse("${AppStrings.urlAPI}/product/name=$keyword"));

    //Check status code
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<Map<String, dynamic>?> getProductById(int id) async {
    final response =
        await http.get(Uri.parse("${AppStrings.urlAPI}/product/productId=$id"));

    //Check status code
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 404) {
      var data = jsonDecode(response.body);
      return data;
    }
    return null;
  }
}
