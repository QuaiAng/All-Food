import 'package:flutter/material.dart';

class AppProvier extends ChangeNotifier {
  static bool _isError = false;
  static int _currentIndexPage = 0;
  static final PageController _pageController = PageController(
    initialPage: _currentIndexPage,
  );
  static final FocusNode _focusNode = FocusNode();
  static final TextEditingController _searchTextcontroller =
      TextEditingController();

  bool get isError => _isError;
  int get currentIndexPage => _currentIndexPage;
  PageController get pageController => _pageController;
  FocusNode get focusNode => _focusNode;
  TextEditingController get searchTextcontroller => _searchTextcontroller;

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

  @override
  void dispose() {
    _focusNode.dispose();
    _searchTextcontroller.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
