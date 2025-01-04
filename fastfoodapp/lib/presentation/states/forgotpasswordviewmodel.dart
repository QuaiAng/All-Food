import 'package:flutter/material.dart';

class Forgotpasswordviewmodel extends ChangeNotifier {
  // TextEditingController cho trường nhập liệu email hoặc số điện thoại
  final TextEditingController _emailOrPhoneController = TextEditingController();

  // GlobalKey cho Form
  final GlobalKey<FormState> _formKeyForgotPassword = GlobalKey<FormState>();

  // Getter cho các controller và formKey
  TextEditingController get emailOrPhoneController => _emailOrPhoneController;
  GlobalKey<FormState> get formKeyForgotPassword => _formKeyForgotPassword;

  // Hàm kiểm tra tính hợp lệ của form
  bool validateForm() {
    return _formKeyForgotPassword.currentState?.validate() ?? false;
  }

  // Hàm xử lý khi người dùng nhấn Tiếp Tục
  void submit() {
    if (validateForm()) {
      //TODO
    }
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    super.dispose();
  }
}
