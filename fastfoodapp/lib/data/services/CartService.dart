import 'dart:convert';
import 'package:fastfoodapp/res/strings.dart';
import 'package:http/http.dart' as http;

class Cartservice {
  Future<Map<String, dynamic>> getCartByUserId(int userId) async {
    final String url = '${AppStrings.urlAPI}/cart/userId=$userId';
    try {
      final response = await http.get(Uri.parse(url));
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
