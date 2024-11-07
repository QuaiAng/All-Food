import 'package:flutter/material.dart';

class AppProvier extends ChangeNotifier {
  static bool _isError = false;

  bool get isError => _isError;

  void errorOTP(bool value) {
    _isError = value;
    notifyListeners();
  }
}
