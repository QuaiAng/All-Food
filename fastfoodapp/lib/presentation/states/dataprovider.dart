import 'package:flutter/material.dart';

class Dataprovider extends ChangeNotifier {
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
    recentSearch.add(value);
    notifyListeners();
  }

  void removeSearchItem(int index) {
    recentSearch.removeAt(index);
    notifyListeners();
  }

  void removeAllSearchItem() {
    recentSearch.removeRange(0, _recentSearch.length);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
