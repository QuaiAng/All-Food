import 'package:flutter/material.dart';

class Detailsearchviewmodel extends ChangeNotifier {
  static final FocusNode _focusNode = FocusNode();
  static final TextEditingController _searchTextcontroller =
      TextEditingController();
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
  FocusNode get focusNode => _focusNode;
  TextEditingController get searchTextcontroller => _searchTextcontroller;

  void addSearchItem(String value) {
    if (value.isNotEmpty && !_recentSearch.contains(value)) {
      _recentSearch.insert(0, value); // Thêm từ khóa mới vào đầu danh sách
      notifyListeners();
    }
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
    _focusNode.dispose();
  }
}
