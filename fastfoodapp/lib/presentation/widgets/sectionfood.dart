import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart'; // File chứa đường dẫn ảnh

class Sectionfood extends StatelessWidget {
  const Sectionfood({
    super.key,
    required this.name_food,
    required this.foodImg,
    required this.foodLocation,
    required this.foodStart,
    required this.foodRating,
  });
  final String name_food;
  final String foodImg;
  final String foodLocation;
  final double foodStart;
  final String foodRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 55.sp,
              width: 55.sp,
              child: Image.asset(
                "assets/images/anhga.png",
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 5.sp,
          ),
          Padding(
            padding: const EdgeInsets.only( bottom: 5),
            child: Text(
              "Gà Rán",
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              "67, Hoàng Diệu",
              style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.placeholderColor,
                  decoration: TextDecoration.none),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 18.sp,
                width: 22.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.primaryColor,
                ),
                child: Text(
                  "4.3",
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "25 min",
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
              Point(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Freeship",
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          )
        ],
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
