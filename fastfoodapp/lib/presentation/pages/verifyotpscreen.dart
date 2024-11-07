import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

String otp = "1234";

class Verifyotpscreen extends StatelessWidget {
  const Verifyotpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ctrl = TextEditingController();
    var provider = Provider.of<AppProvier>(context);
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
        padding: const EdgeInsets.only(left: 40, right: 40),
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.sp,
              ),
              Text(
                "XÁC THỰC OTP",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: SizeOfWidget.sizeOfLoginHeader,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Text(
                "Điền mã OPT gồm 4 chữ số được gửi về email hoặc số điện thoại của bạn.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: AppColors.gray,
                        fontSize: SizeOfWidget.sizeOfH2)),
              ),
              SizedBox(
                height: 25.sp,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Pinput(
                      controller: ctrl,
                      length: 4,
                      forceErrorState: provider.isError,
                      errorPinTheme: StylesOfWidgets.errorPinTheme,
                      defaultPinTheme: StylesOfWidgets.defaultPinTheme,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.sp,
              ),
              Buttonlogin(
                  onClick: () {
                    if (ctrl.text.toString() != otp) {
                      Provider.of<AppProvier>(context, listen: false)
                          .errorOTP(true);
                    } else {
                      Provider.of<AppProvier>(context, listen: false)
                          .errorOTP(false);
                      Navigator.pushNamed(context, RouteName.paymentScreen);
                    }
                  },
                  text: "XÁC NHẬN"),
              SizedBox(
                height: 20.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn chưa nhận được mã OTP?",
                    style: GoogleFonts.inter(
                      fontSize: SizeOfWidget.sizeOfQuestion,
                    ),
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Gửi lại",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeOfWidget.sizeOfQuestion,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
