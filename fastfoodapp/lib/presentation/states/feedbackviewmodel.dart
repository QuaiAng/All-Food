import 'package:flutter/material.dart';

class Feedbackviewmodel extends ChangeNotifier {
  static int _selectedStars = 5;
  int get selectedStars => _selectedStars;

  void updateSelectedStar(int stars) {
    _selectedStars = stars;
    notifyListeners();
  }
}
