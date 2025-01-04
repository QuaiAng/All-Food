import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/forgotpasswordviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonlogin.dart';
import 'package:fastfoodapp/presentation/widgets/textbox.dart';
import 'package:fastfoodapp/presentation/widgets/textheader.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPasswordViewModel =
        Provider.of<Forgotpasswordviewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        shadowColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
          child: Form(
            key: forgotPasswordViewModel.formKeyForgotPassword,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Textheader(
                  h1: "Quên mật khẩu",
                  h2: "Điền vào email hoặc số điện thoại đã đăng ký.",
                  h3: "Tiếp tục đăng nhập",
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Textbox(
                  controller: forgotPasswordViewModel.emailOrPhoneController,
                  label: "Email hoặc số điện thoại",
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại hoặc email để tiếp tục';
                    }
                    if (value.toString().length < 10) {
                      return 'Vui lòng nhập số điện thoại hoặc email để tiếp tục';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Buttonlogin(
                    onClick: () {
                      if (forgotPasswordViewModel.validateForm()) {
                        Navigator.pushNamed(context, RouteName.verifyotpScreen);
                        forgotPasswordViewModel.submit();
                      }
                    },
                    text: "TIẾP TỤC"),
                SizedBox(
                  height: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
