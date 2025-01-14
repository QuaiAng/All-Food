import 'package:fastfoodapp/data/models/User.dart';
import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editinfoviewmodel extends ChangeNotifier {
  // GlobalKey cho Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Userrepository _userrepository;

  Editinfoviewmodel(this._userrepository);
  // Các TextEditingController cho từng trường nhập liệu
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _address = TextEditingController();

  // Getter cho các controller và formKey
  TextEditingController get nameController => _name;
  TextEditingController get emailController => _email;
  TextEditingController get phoneController => _phone;
  TextEditingController get passwordController => _password;
  TextEditingController get addressController => _address;
  GlobalKey<FormState> get formKey => _formKey;

  // Hàm để validate form (kiểm tra tính hợp lệ của dữ liệu)
  bool validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  // Hàm xử lý khi người dùng nhấn lưu (cập nhật dữ liệu)
  void saveData() {
    if (validateForm()) {
      //TODO
    }
  }

  Future<void> getUser() async {
    User? user = await _userrepository.getUser();
    if (user != null) {
      _address.text = "671 Tp Thủ Đức ";
      _email.text = user.email;
      _name.text = user.fullName;
      _phone.text = user.phone;
      _password.text = "00000000";
    }
  }

  Future<String> updateUserInfo() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final response = await _userrepository.updateInfoUser(
        _name.text, _phone.text, _email.text, _prefs.getInt('userId')!);
    return response;
  }

  @override
  void dispose() {
    // Hủy các controller khi không sử dụng nữa
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _address.dispose();
    super.dispose();
  }
}
