import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/widgets/buttonlogin.dart';
import 'package:fastfoodapp/presentation/widgets/textbox.dart';
import 'package:fastfoodapp/presentation/widgets/textheader.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  late bool isAgree;

  @override
  void initState() {
    super.initState();
    isAgree = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.sp,
              ),
              Textheader(
                h1: "Tạo tài khoản",
                h2: "Điền vào các thông ti bên dưới để đăng ký.",
                h3: "Bạn đã có tài khoản?",
                onClick: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 25.sp,
              ),
              const Textbox(
                label: "Họ tên",
                obscureText: false,
              ),
              SizedBox(
                height: 20.sp,
              ),
              const Textbox(
                label: "Email hoặc số điện thoại",
                obscureText: false,
              ),
              SizedBox(
                height: 20.sp,
              ),
              const Textbox(
                label: "Tên đăng nhập",
                obscureText: false,
              ),
              SizedBox(
                height: 20.sp,
              ),
              const Textbox(
                label: "Mật khẩu",
                obscureText: true,
              ),
              SizedBox(
                height: 20.sp,
              ),
              const Textbox(
                label: "Xác nhận mật khẩu",
                obscureText: true,
              ),
              SizedBox(
                height: 20.sp,
              ),
              Buttonlogin(
                  onClick: () {
                    Navigator.pushNamed(context, RouteName.verifyotpScreen);
                  },
                  text: "ĐĂNG KÝ"),
              SizedBox(
                height: 20.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(
                    "Tôi đồng ý với điều khoản sử dụng",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: AppColors.gray,
                            fontSize: SizeOfWidget.sizeOfH2)),
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
                            fontSize: SizeOfWidget.sizeOfLabelText,
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
                      side: const BorderSide(color: Colors.black, width: 0.8),
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
                                    fontSize:
                                        SizeOfWidget.sizeOfButtonLoginText,
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
    );
  }
}
