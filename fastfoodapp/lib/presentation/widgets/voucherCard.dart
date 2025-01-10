import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/models/VoucherModel.dart';
import 'package:fastfoodapp/presentation/pages/detailvoucherscreen.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Vouchercard extends StatelessWidget {
  
  final Vouchermodel voucher;//đối tượng voucher
  final String name;
  final String description;
  final int turn;

  const Vouchercard(
      {Key? key,
      required this.name,
      required this.description,
      required this.turn,
      required this.voucher
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => VoucherDetailScreen(voucher: voucher)
          )
        );
      },
      child: Stack(
        children: [
          Card(
            color: AppColors.backgroundColor,
            elevation: 15, //độ nổi của card
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VoucherDetailScreen(voucher: voucher),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                    ),
                    child: Text(
                      "Chi tiết voucher",
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w300,
                          clr: Colors.white),
                    )),
              ),
            ]),
          ),
          Positioned(
            top: 10.sp,
            right: 20.sp,
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
