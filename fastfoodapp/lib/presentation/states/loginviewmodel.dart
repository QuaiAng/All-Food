import 'package:fastfoodapp/data/models/ResponeLoginModel.dart';
import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginviewmodel extends ChangeNotifier {
  final Userrepository _userrepository;

  Loginviewmodel(this._userrepository);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKeyLogin => _formKeyLogin;

  bool validateForm() {
    return _formKeyLogin.currentState?.validate() ?? false;
  }

  Future<bool> login(String username, String password) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var rp = await _userrepository.login(username, password);
    if (rp != null) {
      final userId = await _prefs.setInt(
          'userId', rp.userId); // Thực hiện lưu vào share_preferences
      final token = await _prefs.setString(
          'token', rp.token); // Thực hiện lưu vào share_preferences
      if (userId && token) {
        return true; //Lưu thành công trả về true, ngược lại trả về false
      }
      return false;
    }
    return false;
  }

  @override
  void dispose() {
    // Hủy các controller khi không còn sử dụng
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
