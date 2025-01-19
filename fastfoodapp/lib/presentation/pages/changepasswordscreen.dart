import 'package:fastfoodapp/presentation/states/changepasswordviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonlogin.dart';
import 'package:fastfoodapp/presentation/widgets/textbox.dart';
import 'package:fastfoodapp/presentation/widgets/textheader.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Changepasswordscreen extends StatelessWidget {
  const Changepasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changePasswordViewModel =
        Provider.of<Changepasswordviewmodel>(context);
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
            size: 30,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
          child: Form(
            key: changePasswordViewModel.formKeyChangePassword,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Textheader(
                  h1: "Đổi mật khẩu",
                  h2: "Điền vào mật khẩu cũ và mật khẩu mới của bạn.",
                  h3: "Bạn đã quên mật khẩu?",
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Textbox(
                  controller: changePasswordViewModel.oldPasswordController,
                  label: "Mật khẩu hiện tại",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu hiện tại';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: changePasswordViewModel.newPasswordController,
                  label: "Mật khẩu mới",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu mới';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller:
                      changePasswordViewModel.confirmNewPasswordController,
                  label: "Xác nhận mật khẩu mới",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập xác nhận mật khẩu mới';
                    }
                    if (changePasswordViewModel.newPasswordController.text !=
                        value) {
                      return 'Mật khẩu xác nhận khác với mật khẩu';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Buttonlogin(
                    onClick: () async {
                      if (changePasswordViewModel.validateForm()) {
                        // Navigator.pushNamed(context, RouteName.verifyotpScreen);
                        final result =
                            await changePasswordViewModel.changePassword().then(
                          (value) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(value),
                              duration: const Duration(seconds: 3),
                            ));
                          },
                        );
                      }
                    },
                    text: "LƯU"),
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
