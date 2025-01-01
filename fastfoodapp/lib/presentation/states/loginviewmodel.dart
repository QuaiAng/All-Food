import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:flutter/material.dart';

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
    var rp = await _userrepository.login(username, password);
    if (rp == null) return false;
    // Thực hiện lưu vào share_preferences
    //Lưu thành công trả về true, ngược lại trả về false
    return true;
  }

  @override
  void dispose() {
    // Hủy các controller khi không còn sử dụng
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
