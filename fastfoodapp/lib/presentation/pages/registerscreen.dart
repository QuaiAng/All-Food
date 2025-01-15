import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/models/UserModel.dart';
import 'package:fastfoodapp/presentation/states/registerviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonlogin.dart';
import 'package:fastfoodapp/presentation/widgets/textbox.dart';
import 'package:fastfoodapp/presentation/widgets/textheader.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/utils/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerViewModel = Provider.of<Registerviewmodel>(context);
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
            key: registerViewModel.formKeyRegister,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Textheader(
                  h1: "Tạo tài khoản",
                  h2: "Điền vào các thông tin bên dưới để đăng ký.",
                  h3: "Bạn đã có tài khoản?",
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Textbox(
                  controller: registerViewModel.nameController,
                  label: "Họ tên",
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập họ tên để đăng ký';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: registerViewModel.phoneController,
                  label: "Số điện thoại",
                  obscureText: false,
                  validator: (value) {
                    if (value.toString().length > 10 ||
                        value.toString().length < 10) {
                      return 'Số điện thoại không hợp lệ';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: registerViewModel.emailController,
                  label: "Email",
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email để đăng ký';
                    }
                    // Biểu thức để kiểm tra định dạng email
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Email không hợp lệ';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: registerViewModel.usernameController,
                  label: "Tên đăng nhập",
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên đăng nhập để đăng ký';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: registerViewModel.passwordController,
                  label: "Mật khẩu",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu để đăng ký';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: registerViewModel.confirmPasswordController,
                  label: "Xác nhận mật khẩu",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng xác nhận mật khẩu để đăng ký';
                    }

                    if (value != registerViewModel.passwordController.text) {
                      return 'Mật khẩu xác nhận không khớp';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Buttonlogin(
                    onClick: () async {
                      final user = Usermodel.withoutIdAndImage(
                        userName: registerViewModel.usernameController.text,
                        password: registerViewModel.passwordController.text,
                        fullName: registerViewModel.nameController.text,
                        email: registerViewModel.emailController.text,
                        phone: registerViewModel.phoneController.text,
                      );
                      if (registerViewModel.validateForm()) {
                        var result = await registerViewModel.register(user);

                        if (result == "ok") {
                          Navigator.pushNamed(
                              context, RouteName.verifyotpScreen);
                        } else {
                          Customdialog.showCustomDialog(
                              context: context,
                              title: "Thông báo",
                              content: result);
                        }
                      }
                    },
                    text: "ĐĂNG KÝ"),
                SizedBox(
                  height: 20.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        activeColor: AppColors.primaryColor,
                        value: registerViewModel.isAgree,
                        onChanged: (value) {
                          registerViewModel.isAgree = value!;
                        }),
                    Text(
                      "Tôi đồng ý với điều khoản sử dụng",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: AppColors.gray,
                              fontSize: SizeOfWidget.sizeOfH3)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.sp,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Hoặc",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: SizeOfWidget.sizeOfH4,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.sp,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: AppColors.placeholderColor, width: 1),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Imagepath.iconGoogle,
                              width: 22.sp,
                              height: 22.sp,
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            Text(
                              "Tiếp tục với Google",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: SizeOfWidget.sizeOfH4,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ))),
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
