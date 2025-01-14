import 'dart:convert';

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
}
