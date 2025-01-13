import 'package:fastfoodapp/presentation/widgets/itemincart.dart';
import 'package:flutter/material.dart';

class Cartviewmodel extends ChangeNotifier {
  final List<Itemincart> _Itemincarts = [
    Itemincart(
      onTap: () {},
      image: 'assets/images/food.png',
      name: "Khoai tây chiên",
      note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
      price: 56000.0,
      quantity: 1,
      shopName: "Từ McDonald's",
    ),
    Itemincart(
      onTap: () {},
      image: 'assets/images/food.png',
      name: "Khoai tây chiên",
      note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
      price: 56000.0,
      quantity: 1,
      shopName: "Từ McDonald's",
    ),
    Itemincart(
      onTap: () {},
      image: 'assets/images/food.png',
      name: "Khoai tây chiên",
      note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
      price: 56000.0,
      quantity: 1,
      shopName: "Từ McDonald's",
    ),
    Itemincart(
      onTap: () {},
      image: 'assets/images/food.png',
      name: "Khoai tây chiên",
      note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
      price: 56000.0,
      quantity: 1,
      shopName: "Từ McDonald's",
    ),
    Itemincart(
      onTap: () {},
      image: 'assets/images/food.png',
      name: "Khoai tây chiên",
      note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
      price: 56000.0,
      quantity: 1,
      shopName: "Từ McDonald's",
    ),
    Itemincart(
      onTap: () {},
      image: 'assets/images/food.png',
      name: "Khoai tây chiên",
      note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
      price: 56000.0,
      quantity: 1,
      shopName: "Từ McDonald's",
    ),
    Itemincart(
      onTap: () {},
      image: 'assets/images/food.png',
      name: "Khoai tây chiên",
      note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
      price: 56000.0,
      quantity: 1,
      shopName: "Từ McDonald's",
    ),
  ];

  List get Itemincarts => _Itemincarts;

  void addToCart(Itemincart value) {
    _Itemincarts.add(value);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _Itemincarts.removeAt(index);
    notifyListeners();
  }

}
