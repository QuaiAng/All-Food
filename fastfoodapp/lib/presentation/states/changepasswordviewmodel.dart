import 'package:flutter/material.dart';

class Changepasswordviewmodel extends ChangeNotifier {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKeyChangePassword = GlobalKey<FormState>();

  TextEditingController get oldPasswordController => _oldPasswordController;
  TextEditingController get newPasswordController => _newPasswordController;
  TextEditingController get confirmNewPasswordController =>
      _confirmNewPasswordController;

  GlobalKey<FormState> get formKeyChangePassword => _formKeyChangePassword;

  bool validateForm() {
    return _formKeyChangePassword.currentState?.validate() ?? false;
  }

  // Hàm xử lý khi người dùng nhấn lưu (cập nhật dữ liệu)
  void saveData() {
    if (validateForm()) {
      //TODO
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }
}
