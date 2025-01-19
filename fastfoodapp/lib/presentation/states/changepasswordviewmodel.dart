import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Changepasswordviewmodel extends ChangeNotifier {
  final Userrepository _userrepository;

  Changepasswordviewmodel(this._userrepository);

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
    if (validateForm()) {}
  }

  Future<String> changePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final rp = await _userrepository.changePassword(
        _oldPasswordController.text.toString(),
        _newPasswordController.text.toString(),
        prefs.getInt('userId')!);
    
    _oldPasswordController.text = '';
    _newPasswordController.text = '';
    _confirmNewPasswordController.text = '';
    return rp;
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }
}
