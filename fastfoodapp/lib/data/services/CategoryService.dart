import 'dart:convert';

import 'package:fastfoodapp/data/models/CategoryModel.dart';
import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class Categoryservice {
  Future<Map<String, dynamic>> getCategoryByCategoryId(int categoryId) async {
    final response = await http
        .get(Uri.parse("${AppStrings.urlAPI}/category/${categoryId}"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // dữ liệu thô
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<List<Categorymodel>> getCategoriesByShopId(int shopId) async {
    final url = Uri.parse(
        '${AppStrings.urlAPI}/category/shopId=$shopId'); // Đường dẫn API

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['success']) {
          final List<dynamic> categoryList = data['data'];
          return categoryList
              .map((json) => Categorymodel.fromJSON(json))
              .toList();
        } else {
          throw Exception("Lỗi khi lấy dữ liệu");
        }
      } else {
        throw Exception("Lỗi HTTP: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Lỗi khi gọi API: $e");
    }
  }
}
