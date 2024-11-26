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
                fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
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
              size: 20,
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
                  style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                ),
                subtitle: Text(
                  "Thanh toán qua ví MOMO",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3, clr: Colors.grey),
                ),
                leading: SizedBox(
                  width: 24.sp,
                  height: 24.sp,
                  child: Image.asset(Imagepath.iconMoMo),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: const Divider(),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  "Tiền mặt",
                  style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                ),
                subtitle: Text(
                  "Thanh toán khi nhận hàng",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3, clr: Colors.grey),
                ),
                leading: SizedBox(
                  width: 24.sp,
                  height: 24.sp,
                  child: Image.asset(Imagepath.iconCash),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ));
  }
}
