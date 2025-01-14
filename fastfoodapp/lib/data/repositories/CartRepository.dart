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
}
