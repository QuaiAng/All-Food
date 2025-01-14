import 'package:fastfoodapp/data/models/CartDetailModel.dart';
import 'package:fastfoodapp/data/models/CartModel.dart';
import 'package:fastfoodapp/data/repositories/CartRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cartviewmodel extends ChangeNotifier {
  CartRepository _cartRepository;
  Cartviewmodel(this._cartRepository);

  Cartmodel? cartmodel;

  Future<Cartmodel> getCartByUserId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId;
    if (_prefs.containsKey('userId')) {
      userId = _prefs.getInt('userId');
    } else {
      userId = 0;
    }
    final response = await _cartRepository.getCartByUserId(userId);
    cartmodel = response!;
    // notifyListeners();
    return response;
  }

  void addToCart(Cartdetailmodel value) {
    cartmodel!.cartDetails.add(value);
    notifyListeners();
  }

  void removeFromCart(int index) {
    cartmodel!.cartDetails.removeAt(index);
    notifyListeners();
  }
}
