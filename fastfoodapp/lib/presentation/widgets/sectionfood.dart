import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart'; // File chứa đường dẫn ảnh

class Sectionfood extends StatelessWidget {
  const Sectionfood(
      {super.key,
      required this.name_food,
      required this.foodImg,
      required this.foodLocation,
      required this.foodRating,
      required this.time,
      required this.delivery});
  final String name_food;
  final String foodImg;
  final String foodLocation;
  final int foodRating;
  final int time;
  final String delivery;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(SizeOfWidget.sizeOfH4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 55.sp,
                width: 55.sp,
                child: Image.asset(
                  foodImg,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 4.sp,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.sp),
              child: Text(
                name_food,
                style: GoogleFonts.inter(
                    fontSize: SizeOfWidget.sizeOfH1,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.sp),
              child: Text(
                foodLocation,
                style: GoogleFonts.inter(
                    fontSize: SizeOfWidget.sizeOfH3,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                    decoration: TextDecoration.none),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: SizeOfWidget.sizeOfH1,
                  width: 21.sp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "$foodRating",
                    style: GoogleFonts.inter(
                        fontSize: SizeOfWidget.sizeOfH4,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Text(
                    "$time min",
                    style: GoogleFonts.inter(
                      fontSize: SizeOfWidget.sizeOfH3,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                    ),
                  ),
                ),
                const Point(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Text(
                    delivery,
                    style: GoogleFonts.inter(
                      fontSize: SizeOfWidget.sizeOfH3,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Point extends StatelessWidget {
  const Point({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.sp,
      height: 10.sp,
      padding: const EdgeInsets.all(8),
      decoration:
          const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}
