import 'dart:convert';

import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class Reviewservice {
  Future<List<dynamic>> getListReviewByProductId(int productId) async {
    final response = await http
        .get(Uri.parse("${AppStrings.urlAPI}/review/productId=${productId}"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      return jsonDecode(response.body);
    }
  }
}
