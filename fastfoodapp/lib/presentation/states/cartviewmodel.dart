import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/models/CartDetailModel.dart';
import 'package:fastfoodapp/data/models/CartModel.dart';
import 'package:fastfoodapp/data/repositories/CartRepository.dart';
import 'package:fastfoodapp/presentation/pages/paymentscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cartviewmodel extends ChangeNotifier {
  CartRepository _cartRepository;
  Cartviewmodel(this._cartRepository);

  Cartmodel? cartmodel;

  List<Cartdetailmodel> get cartDetails => cartmodel?.cartDetails ?? [];

  Future<Cartmodel?> getCartByUserId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId;
    if (_prefs.containsKey('userId')) {
      userId = _prefs.getInt('userId');
    } else {
      userId = 0;
    }
    final response = await _cartRepository.getCartByUserId(userId);
    if (response != null) {
      cartmodel = response;
      return response;
    }
    // notifyListeners();
    return null;
  }

  Future<bool> addToCart(Cartdetailmodel cartdetail) async {
    final response = await _cartRepository.addToCart(cartdetail);
    notifyListeners();
    return response;
  }

  Future<String> removeFromCart(int productId, int cartId) async {
    final response = await _cartRepository.removeFromCart(productId, cartId);
    notifyListeners();
    return response;
  }

  //Kiểm tra trạng thái đăng nhập
  int? _userId;
  Future<bool> checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getInt('userId');
    return _userId != null;
  }

  int? get userId => _userId;



}
