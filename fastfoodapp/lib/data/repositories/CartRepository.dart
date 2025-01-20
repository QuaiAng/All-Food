import 'package:fastfoodapp/data/models/CartDetailModel.dart';

import '../models/CartModel.dart';
import '../services/CartService.dart'; // Đường dẫn đến lớp Cartservice

class CartRepository {
  final Cartservice _cartService;

  CartRepository(this._cartService);

  Future<Cartmodel?> getCartByUserId(int userId) async {
    try {
      final response = await _cartService.getCartByUserId(userId);
      if (response['success'] == true) {
        return Cartmodel.fromJson(response['data']);
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Error in CartRepository: $error');
    }
  }

  Future<bool> addToCart(Cartdetailmodel cart) async {
    try {
      final response = await _cartService.addToCart(cart);
      return response;
    } catch (error) {
      throw Exception('Error in CartRepository: $error');
    }
  }

  Future<String> removeFromCart(int productId, int cartId) async {
    try {
      final response = await _cartService.removeFromCart(productId, cartId);
      return response['message'].toString();
    } catch (error) {
      throw Exception('Error in CartRepository: $error');
    }
  }

  Future<bool> updateQuantity(int quantity, int productId, int cartId) async {
    try {
      final response =
          await _cartService.updateQuantity(quantity, productId, cartId);
      return response['success'];
    } catch (error) {
      throw Exception('Error in CartRepository: $error');
    }
  }
}
