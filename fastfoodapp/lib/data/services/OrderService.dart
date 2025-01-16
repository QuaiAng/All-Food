import 'dart:convert';

import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class Orderservice {
  Future<List<dynamic>?> getOrderByUserId(int userID) async {
    try {
      final response = await http
          .get(Uri.parse("${AppStrings.urlAPI}/order/userId=$userID"));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['data'];
        return jsonData;
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      throw Exception('Error fetching cart data: $error');
    }
  }

  Future<Map<String, dynamic>> cancelOrder(int orderId) async {
    final String url = '${AppStrings.urlAPI}/order/remove/$orderId';
    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      throw Exception('Error fetching cart data: $error');
    }
  }
}
