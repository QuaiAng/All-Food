import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';

class Itemrow extends StatelessWidget {
  const Itemrow(
      {super.key,
      required this.quantity,
      required this.name,
      required this.description,
      required this.price});

  final int quantity;
  final String name;
  final String description;
  final double price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Chi tiết sản phẩm");
      },
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 6.sp, right: 10.sp, left: 10.sp),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(4)),
              child: Text("x$quantity",
                  style: GoogleFonts.inter(color: AppColors.primaryColor)),
            ),
            SizedBox(width: 15.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: GoogleFonts.inter(fontSize: 17.sp)),
                  Text(description,
                      style: GoogleFonts.inter(
                          fontSize: 15.sp, color: AppColors.placeholderColor)),
                ],
              ),
            ),
            SizedBox(
              width: 20.sp,
            ),
            Text(
              Formatmoney.formatCurrency(price),
              style: GoogleFonts.inter(
                  fontSize: 15.5.sp, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
