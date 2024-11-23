import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/widgets/buttonlogin.dart';
import 'package:fastfoodapp/presentation/widgets/textbox.dart';
import 'package:fastfoodapp/presentation/widgets/textheader.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Changepasswordscreen extends StatefulWidget {
  const Changepasswordscreen({super.key});

  @override
  State<Changepasswordscreen> createState() => _ChangepasswordscreenState();
}

class _ChangepasswordscreenState extends State<Changepasswordscreen> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formChangePassword =
        Provider.of<AppProvier>(context).formKeyChangePassword;
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
            key: formChangePassword,
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
                  controller: oldPasswordController,
                  label: "Mật khẩu hiện tại",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại hoặc email để tiếp tục';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: newPasswordController,
                  label: "Mật khẩu mới",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại hoặc email để tiếp tục';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: confirmNewPasswordController,
                  label: "Xác nhận mật khẩu mới",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại hoặc email để tiếp tục';
                    }
                    if (newPasswordController.text != value) {
                      return 'Mật khẩu xác nhận khác với mật khẩu';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Buttonlogin(
                    onClick: () {
                      if (formChangePassword.currentState!.validate()) {
                        Navigator.pushNamed(context, RouteName.verifyotpScreen);
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
