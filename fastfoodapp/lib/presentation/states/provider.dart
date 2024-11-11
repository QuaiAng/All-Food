import 'package:flutter/material.dart';

class AppProvier extends ChangeNotifier {
  static bool _isError = false;
  static int _currentIndexPage = 0;
  static final PageController _pageController = PageController(
    initialPage: _currentIndexPage,
  );

  bool get isError => _isError;
  int get currentIndexPage => _currentIndexPage;
  PageController get pageController => _pageController;

  void errorOTP(bool value) {
    _isError = value;
    notifyListeners();
  }

  void moveToPage(index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void setCurrentIndexPage(int index) {
    _currentIndexPage = index;
    notifyListeners();
  }
}
