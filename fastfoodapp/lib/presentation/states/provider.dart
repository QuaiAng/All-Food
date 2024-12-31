import 'package:flutter/material.dart';

class AppProvier extends ChangeNotifier {
  //Khai báo biến gốc

  static bool _isError = false;
  static int _currentIndexPage = 0;
  static int _orderStatus = 1;
  static final PageController _pageController = PageController(
    initialPage: _currentIndexPage,
  );

  //Khai tạo getter
  int get orderStatus => _orderStatus;
  bool get isError => _isError;
  int get currentIndexPage => _currentIndexPage;
  PageController get pageController => _pageController;
  static final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  //Các phương thức

  void errorOTP(bool value) {
    _isError = value;
    notifyListeners();
  }

  void moveToPage(index) {
    // _pageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.fastOutSlowIn,
    // );
    _pageController.jumpToPage(index);
  }

  void setCurrentIndexPage(int index) {
    _currentIndexPage = index;
    notifyListeners();
  }

  void updateOrderstatus(int value) {
    _orderStatus = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
}
