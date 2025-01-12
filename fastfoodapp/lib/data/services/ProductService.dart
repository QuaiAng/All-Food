import 'dart:convert';

import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class Productservice {
  //Dưới này giao tiếp với API, chỉ có nhiệm vụ duy nhất đó, không kiểm tra, không convert data

  Future<List<dynamic>> SearchProductByName(String keyword) async {
    final response = await http
        .get(Uri.parse("${AppStrings.urlAPI}/product/name=${keyword}"));

    //Check status code
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<List<dynamic>> getListProductBestSeller() async {
    final response = await http.get(Uri.parse(
        "${AppStrings.urlAPI}/product/Get5HighestProducts")); // lấy ra 5 sản phẩm best seller

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      return jsonDecode(response.body);
    }
  }
}
