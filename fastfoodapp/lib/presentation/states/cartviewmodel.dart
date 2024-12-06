import 'package:fastfoodapp/presentation/widgets/itemincart.dart';
import 'package:flutter/material.dart';

class Cartviewmodel extends ChangeNotifier {
  List<Itemincart> _Itemincarts = [
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

  final List<String> _recentSearch = [
    "Bánh mì",
    "Phở bò",
    "Cơm tấm",
    "Hủ tiếu",
    "Bún chả",
    "Chả giò",
    "Gỏi cuốn",
    "Mì Quảng",
    "Bún bò Huế",
    "Cơm chiên Dương Châu",
    "Nem nướng",
    "Lẩu Thái",
    "Chè thập cẩm",
    "Trà sữa",
    "Nước ép trái cây",
    "Pizza",
    "Bánh bao",
    "Bánh xèo",
    "Súp cua",
    "Chả cá Lã Vọng",
  ];

  List<String> get recentSearch => _recentSearch;
  void addSearchItem(String value) {
    _recentSearch.add(value);
    notifyListeners();
  }

  void removeSearchItem(int index) {
    _recentSearch.removeAt(index);
    notifyListeners();
  }

  void removeAllSearchItem() {
    _recentSearch.removeRange(0, _recentSearch.length);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
