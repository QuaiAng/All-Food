import 'package:fastfoodapp/data/repositories/UserRepository.dart';
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

  Future<String> login(String username, String password) async {
    return await Userrepository().login(username, password);
  }

  @override
  void dispose() {
    // Hủy các controller khi không còn sử dụng
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
