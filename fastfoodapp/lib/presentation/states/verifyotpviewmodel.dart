import 'package:flutter/material.dart';

class Verifyotpviewmodel with ChangeNotifier {
  final TextEditingController _otpController = TextEditingController();
  bool _isError = false;
  String _correctOtp = "1234";

  // Getter
  TextEditingController get otpController => _otpController;
  bool get isError => _isError;

  // Setter
  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  // Phương thức xác thực OTP
  void validateOtp() {
    if (_otpController.text == _correctOtp) {
      _isError = false;
      notifyListeners();
    } else {
      _isError = true;
      notifyListeners();
    }
  }

  void resendOtp() {
    print("OTP đã được gửi lại.");
  }

  void disposeController() {
    _otpController.dispose();
  }
}
