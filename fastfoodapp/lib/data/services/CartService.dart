import 'dart:convert';
import 'package:fastfoodapp/data/models/CartDetailModel.dart';
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

  Future<bool> addToCart(Cartdetailmodel cartdetail) async {
    Map<String, dynamic> requestBody = {
      "productId": cartdetail.productId,
      "cartId": cartdetail.cartId,
      "quantity": cartdetail.quantity,
      "shopId": cartdetail.shopId
    };

    final response = await http.post(
      Uri.parse("${AppStrings.urlAPI}/cartdetail/add"),
      headers: {
        "Content-Type":
            "application/json", // Tiêu đề yêu cầu (tuỳ chỉnh nếu cần)
      },
      body: jsonEncode(requestBody), // Chuyển đổi dữ liệu sang dạng JSON
    );

    return response.statusCode == 200;
  }

  Future<Map<String, dynamic>> removeFromCart(int productId, int cartId) async {
    final String url =
        '${AppStrings.urlAPI}/cartdetail/remove/productId=$productId/cartId=$cartId';
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
