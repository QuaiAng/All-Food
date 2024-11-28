import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/states/verifyotpviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonlogin.dart';
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
    var verifyotpViewModel = Provider.of<Verifyotpviewmodel>(context);
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
                        fontSize: SizeOfWidget.sizeOfLargeHeader,
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
                        fontSize: SizeOfWidget.sizeOfH3)),
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
                      controller: verifyotpViewModel.otpController,
                      length: 4,
                      forceErrorState: verifyotpViewModel.isError,
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
                    verifyotpViewModel.validateOtp();
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
                      fontSize: SizeOfWidget.sizeOfH3,
                    ),
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  InkWell(
                    onTap: () {
                      verifyotpViewModel.resendOtp();
                    },
                    child: Text(
                      "Gửi lại",
                      textAlign: TextAlign.left,
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w600,
                          clr: AppColors.primaryColor),
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
