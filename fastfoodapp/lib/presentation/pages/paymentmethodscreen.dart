import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Paymentmethodscreen extends StatelessWidget {
  const Paymentmethodscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "PHƯƠNG THỨC THANH TOÁN",
            style: StylesOfWidgets.textStyle1(
                fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w400),
          ),
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
          color: AppColors.backgroundColor,
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  "Ví MOMO",
                  style: GoogleFonts.inter(),
                ),
                subtitle: Text(
                  "Thanh toán qua ví MOMO",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(color: AppColors.gray)),
                ),
                leading: Container(
                  width: 25.sp,
                  height: 25.sp,
                  child: Image.asset(Imagepath.iconMoMo),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18.sp,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: const Divider(),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  "Tiền mặt",
                  style: GoogleFonts.inter(),
                ),
                subtitle: Text(
                  "Thanh toán khi nhận hàng",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(color: AppColors.gray)),
                ),
                leading: SizedBox(
                  width: 25.sp,
                  height: 25.sp,
                  child: Image.asset(Imagepath.iconCash),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18.sp,
                    )),
              ),
            ],
          ),
        ));
  }
}
