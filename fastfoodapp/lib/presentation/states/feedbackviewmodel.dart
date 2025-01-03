import 'package:flutter/material.dart';

class Feedbackviewmodel extends ChangeNotifier {
  final String _foodName = "";
  final String _shopName = "";
  final int _price = 0;
  final TextEditingController _feedback = TextEditingController(text: "");

  TextEditingController get feedbackController => _feedback;
  String get foodName => _foodName;
  String get shopName => _shopName;
  int get price => _price;

  static int _selectedStars = 5;
  int get selectedStars => _selectedStars;

  void updateSelectedStar(int stars) {
    _selectedStars = stars;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
