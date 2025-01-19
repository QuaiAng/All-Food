import 'package:flutter/material.dart';

class Ordermanagementviewmodel extends ChangeNotifier {
  bool _isPendingTab = true;

  bool get isPendingTab => _isPendingTab;

  void toggleTab(bool isPending) {
    _isPendingTab = isPending;
    notifyListeners();
  }
}
