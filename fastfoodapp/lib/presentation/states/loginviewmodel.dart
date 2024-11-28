import 'package:flutter/material.dart';

class Loginviewmodel extends ChangeNotifier {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKeyLogin => _formKeyLogin;

  bool validateForm() {
    return _formKeyLogin.currentState?.validate() ?? false;
  }

  // Hàm xử lý khi người dùng nhấn Đăng nhập
  void login() {
    if (validateForm()) {
      //TODO
    }
  }

  @override
  void dispose() {
    // Hủy các controller khi không còn sử dụng
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
