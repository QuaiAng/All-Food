import 'package:flutter/material.dart';

class Detailproductscreenviewmodel extends ChangeNotifier {
  int quantity = 1;

  int get _quantity => quantity;

  void resetQuantity() {
    quantity = 1;
    // notifyListeners();
  }

  void btnHigh() {
    quantity++;
    notifyListeners();
  }

  void btnLow() {
    if (quantity > 1) quantity--;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    quantity = 1;
  }
}
