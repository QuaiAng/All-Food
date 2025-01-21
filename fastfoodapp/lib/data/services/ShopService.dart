import 'dart:convert';
import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class Shopservice {
  Future<List<dynamic>> getListShopHighRating() async {
    final response = await http.get(Uri.parse(
        "${AppStrings.urlAPI}/shop/Get5HighestShops")); // lấy ra 5 shop

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data']; // dữ liệu trả về là 1 list
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getShopByShopId(int shopId) async {
    final response =
        await http.get(Uri.parse("${AppStrings.urlAPI}/shop/shopId=$shopId"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
   Future<Map<String, dynamic>> getShopByShop(int shopId) async {
    final response =
        await http.get(Uri.parse("${AppStrings.urlAPI}/shop/shopId=$shopId"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
