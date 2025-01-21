import 'dart:convert';

import 'package:fastfoodapp/data/models/OrderModel.dart';
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

  Future<Map<String, dynamic>> cancelOrder(
      int orderId, int userId, int orderStatus) async {
    final String url =
        '${AppStrings.urlAPI}/order/update/orderId=$orderId/userId=$userId/orderStatus=$orderStatus';
    try {
      final response = await http.put(Uri.parse(url));
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

  Future<bool> addToOrder(OrderModel order) async {
    Map<String, dynamic> requestBody = {
      "userId": order.userId,
      "total": order.total,
      "shopId": order.shopId,
      "deliveryAddress": order.deliveryAddress,
      "paymentMethod": order.paymentMethod,
      "discount": order.discount,
      "fullNameUser": order.fullNameUser,
      "shopName": order.shopName,
      "phoneNum": order.phoneNum,
      "orderDetails": order.orderDetails
          .map((detail) => {
                "orderId": 0,
                "productId": detail.productId,
                "quantity": detail.quantity,
                "price": detail.price,
                "note": detail.note,
                "productName": detail.productName
              })
          .toList(),
    };

    final response = await http.post(
      Uri.parse("${AppStrings.urlAPI}/order/add"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(requestBody),
    );

    return response.statusCode == 200;
  }

  Future<Map<String, dynamic>> getOrderByOrderId(int orderId) async {
    try {
      final response = await http
          .get(Uri.parse("${AppStrings.urlAPI}/order/orderId=$orderId"));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['data'];
        return jsonData;
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      throw Exception('Error fetching order data: $error');
    }
  }
}
