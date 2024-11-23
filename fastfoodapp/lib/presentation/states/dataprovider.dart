import 'package:fastfoodapp/presentation/widgets/itemincart.dart';
import 'package:flutter/material.dart';

class Dataprovider extends ChangeNotifier {
  final List _Itemincarts = List.generate(12, (index) {
    return Itemincart(
      onTap: () {},
      image: 'assets/images/food.png',
      name: "McDonald's",
      note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
      price: 56000.0,
      quantity: 1,
    );
  });

  List get Itemincarts => _Itemincarts;

  void addToCart(Itemincart value) {
    _Itemincarts.add(value);
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
