import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Vouchercard extends StatelessWidget {
  const Vouchercard(
      {super.key,
      required this.name,
      required this.description,
      required this.turn});

  final String name;
  final String description;
  final int turn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Chi tiết voucher");
        //Navigator.pushNamed(context, RouteName.paymentScreen);
      },
      child: Stack(
        children: [
          Card(
            color: AppColors.backgroundColor,
            elevation: 10, //độ nổi của card
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Imagepath.iconVoucher,
                        width: 22.sp,
                        height: 22.sp,
                      ),
                      SizedBox(width: 15.sp),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w400),
                          ),
                          SizedBox(height: 10.sp),
                          SizedBox(
                            width: 60.sp,
                            child: Text(
                              description,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH3,
                                  fw: FontWeight.w400,
                                  clr: Colors.grey),
                            ),
                          ),
                        ],
                      )),
                    ],
                  )),
              SizedBox(
                height: 20.sp,
              ),
              SizedBox(
                width: double.infinity,
                height: 30.sp,
                child: ElevatedButton(
                    onPressed: () {
                      print("Chi tiết voucher");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primaryColor, // Màu nền cam giống hình mẫu
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                    ),
                    child: Text(
                      "Chi tiết voucher",
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: SizeOfWidget.sizeOfH3,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    )),
              ),
            ]),
          ),
          Positioned(
            top: 10.sp,
            right: 16.sp,
            child: Text("Còn $turn lượt",
                style: GoogleFonts.inter(
                  textStyle:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                )),
          )
        ],
      ),
    );
  }
}
