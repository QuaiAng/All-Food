import 'package:fastfoodapp/data/models/UserModel.dart';
import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:flutter/material.dart';

class Registerviewmodel with ChangeNotifier {
  // Các thuộc tính private
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isAgree = false;

  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();

  // Getter cho các thuộc tính
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  bool get isAgree => _isAgree;

  GlobalKey<FormState> get formKeyRegister => _formKeyRegister;

  // Setter cho isAgree (nếu cần thay đổi giá trị từ UI)
  set isAgree(bool value) {
    _isAgree = value;
    notifyListeners(); // Thông báo để cập nhật UI khi giá trị thay đổi
  }

  // Hàm validate và xử lý logic
  bool validateForm() {
    if (_formKeyRegister.currentState != null &&
        _formKeyRegister.currentState!.validate()) {
      return true;
    }
    return false;
  }

  Future<bool> register(Usermodel user) async {
    if (user.fullName.isEmpty ||
        user.email.isEmpty ||
        user.phone.isEmpty ||
        user.password.isEmpty) {
      return false;
    }

    return await Userrepository().register(user);
  }

  void disposeControllers() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}
