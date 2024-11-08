import 'package:fastfoodapp/presentation/widgets/advertisement.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'dart:core';

class Restaurant extends StatelessWidget {
  const Restaurant(
      {super.key,
      required this.name_restaurant,
      required this.images,
      required this.price,
      required this.category_food,
      required this.rating,
      required this.comment,
      required this.time,
      required this.delivery});

  final String name_restaurant;
  final List<String> images;
  final String price;
  final String category_food;
  final String rating;
  final String comment;
  final String time;
  final String delivery;

  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          // navigation sang màn hình chi tiết món ăn
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Listimageindicator(images: images),
                    SizedBox(height: 15.sp),
                    Text(name_restaurant,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                                decorationColor: Colors.white))),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(price,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decorationColor: Colors.white))),
                        ),
                        Point(),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text(category_food,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decorationColor: Colors.white))),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(rating,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decorationColor: Colors.white))),
                        SizedBox(width: 12.sp),
                        Icon(
                            // icon ngôi sao
                            Icons.star,
                            color: AppColors.primaryColor),
                        SizedBox(width: 12.sp),
                        Text(comment,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decorationColor: Colors.white))),
                        SizedBox(width: 12.sp),
                        Point(),
                        SizedBox(width: 12.sp),
                        Icon(
                          // icon đòng hồ
                          Icons.punch_clock_rounded,
                          color: Colors.grey, size: 20.sp,
                        ),
                        Text(time,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decorationColor: Colors.white))),
                        SizedBox(width: 12.sp),
                        Point(),
                        SizedBox(width: 12.sp),
                        CircleAvatar(
                          // vòng tròn chứa icon dollar
                          backgroundColor: Colors.grey,
                          radius: 13.sp,
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(width: 6.sp),
                        Text(delivery,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decorationColor: Colors.white))),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
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
