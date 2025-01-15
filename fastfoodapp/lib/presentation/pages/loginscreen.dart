import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/loginviewmodel.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/widgets/buttonlogin.dart';
import 'package:fastfoodapp/presentation/widgets/textbox.dart';
import 'package:fastfoodapp/presentation/widgets/textheader.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  GlobalKey<FormState>? _formKeyLogin;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<Loginviewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        shadowColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            // Provider.of<AppProvier>(context, listen: false)
            //     .setCurrentIndexPage(0);
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
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKeyLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Textheader(
                  h1: "Đăng nhập",
                  h2: "Điền tên đăng nhập và mật khẩu của bạn.",
                  h3: "Bạn chưa có tài khoản?",
                  onClick: () {
                    Navigator.pushNamed(context, RouteName.registerScreen);
                  },
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Textbox(
                  controller: loginViewModel.usernameController,
                  label: "Tên đăng nhập",
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên đăng nhập để đăng nhập';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Textbox(
                  controller: loginViewModel.passwordController,
                  label: "Mật khẩu",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu để đăng nhập';
                    }
                    return null; // Dữ liệu hợp lệ
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Buttonlogin(
                    onClick: () async {
                      // Đợi kiểm tra thông tin login và kết quả trả về
                      if (_formKeyLogin!.currentState!.validate()) {
                        bool result = await loginViewModel.login(
                          loginViewModel.usernameController.text,
                          loginViewModel.passwordController.text,
                        );
                        // Kiểm tra xem chuỗi trả về có rỗng không
                        if (result == true) {
                          // Nếu login thành công, chuyển hướng đến màn hình mới
                          Navigator.pushNamed(context, RouteName.mainScreen);
                          print(result); // In ra kết quả từ login
                        } else {
                          // Xử lý khi login không thành công (chuỗi rỗng)
                          print("Đăng nhập không thành công.");
                        }
                      }
                    },
                    text: "ĐĂNG NHẬP"),
                SizedBox(
                  height: 25.sp,
                ),
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.forgotPasswordScreen);
                    },
                    child: Text(
                      "Bạn đã quên mật khẩu?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: SizeOfWidget.sizeOfH3)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.sp,
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
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH4, fw: FontWeight.w500),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
