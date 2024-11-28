import 'package:flutter/material.dart';

class Editinfoviewmodel extends ChangeNotifier {
  // GlobalKey cho Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Các TextEditingController cho từng trường nhập liệu
  final TextEditingController _name =
      TextEditingController(text: 'CAO HOAI AN');
  final TextEditingController _email =
      TextEditingController(text: 'caohoaian@gmail.com');
  final TextEditingController _phone =
      TextEditingController(text: '0785763022');
  final TextEditingController _password =
      TextEditingController(text: '123456789');
  final TextEditingController _address =
      TextEditingController(text: '749 Huỳnh Tấn Phát, Phú Thuận, Quận 7 ');

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
