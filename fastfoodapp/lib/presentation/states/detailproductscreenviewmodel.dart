import 'package:flutter/material.dart';

class Detailproductscreenviewmodel extends ChangeNotifier {
  int quantity = 01;

  int get _quantity => quantity;

  void btnHigh() {
    quantity++;
    notifyListeners();
  }

  void btnLow() {
    if (quantity <= 0) {
      quantity = 0;
    } else {
      quantity--;
    }
    notifyListeners();
  }
}
