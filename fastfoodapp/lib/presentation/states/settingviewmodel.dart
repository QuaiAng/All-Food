import 'package:fastfoodapp/data/models/User.dart';

import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settingviewmodel with ChangeNotifier {
  // Các trạng thái của màn hình
  final Userrepository _userRepository;
  Settingviewmodel(this._userRepository);

  bool _notificationSound = true;

  bool _sound = false;
  bool _updateNotification = true;
  String _selectedLanguage = "Vietnam";
  String fullName = '';
  String email = '';

  // Getters để truy cập trạng thái
  bool get notificationSound => _notificationSound;
  bool get sound => _sound;
  bool get updateNotification => _updateNotification;
  String get selectedLanguage => _selectedLanguage;

  Future<User?> getUser() async {
    User? user = await _userRepository.getUser();
    if (user!.fullName != fullName || user.email != email) {
      fullName = user!.fullName;
      email = user!.email;
      notifyListeners();
    }

    return user;
  }

  set selectedLanguage(String value) {
    _selectedLanguage = value;
    notifyListeners();
  }

  Future<void> updateStateFullName() async {
    User? user = await _userRepository.getUser();
    fullName = user!.fullName;
    notifyListeners();
  }

  Future<void> updateStateEmail() async {
    User? user = await _userRepository.getUser();
    email = user!.email;
    notifyListeners();
  }

  set sound(bool value) {
    _sound = value;
    notifyListeners();
  }

  set notificationSound(bool value) {
    _notificationSound = value;
    notifyListeners();
  }

  set updateNotification(bool value) {
    _updateNotification = value;
    notifyListeners();
  }

  // Thay đổi trạng thái và thông báo cho UI
  void toggleNotificationSound(bool value) {
    _notificationSound = value;
    notifyListeners();
  }

  void toggleSound(bool value) {
    _sound = value;
    notifyListeners();
  }

  void toggleUpdateNotification(bool value) {
    _updateNotification = value;
    notifyListeners();
  }

  void changeLanguage(String newLanguage) {
    _selectedLanguage = newLanguage;
    notifyListeners();
  }

  //Kiểm tra trạng thái đăng nhập
  int? _userId;
  Future<bool> checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getInt('userId');
    return _userId != null;
  }

  int? get userId => _userId;

  //Xử lý đăng xuất

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }
}
