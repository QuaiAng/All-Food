import 'package:fastfoodapp/presentation/widgets/advertisement.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.sp,
                    width: double.infinity,
                    child: Listimageindicator(images: images),
                  ),
                  SizedBox(height: 15.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name_restaurant,
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w300)),
                      SizedBox(height: 10.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(price,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ))),
                          ),
                          const Point(),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Text(category_food,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 15.sp,
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
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decorationColor: Colors.white))),
                          SizedBox(width: 12.sp),
                          const Icon(
                              // icon ngôi sao
                              Icons.star,
                              color: AppColors.primaryColor),
                          SizedBox(width: 12.sp),
                          Text(comment,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decorationColor: Colors.white))),
                          SizedBox(width: 12.sp),
                          const Point(),
                          SizedBox(width: 12.sp),
                          Icon(
                            // icon đòng hồ
                            Icons.timer_sharp,
                            color: Colors.grey, size: 20.sp,
                          ),
                          Text(time,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decorationColor: Colors.white))),
                          SizedBox(width: 12.sp),
                          const Point(),
                          SizedBox(width: 12.sp),
                          CircleAvatar(
                            // vòng tròn chứa icon dollar
                            backgroundColor: Colors.grey,
                            radius: 13.sp,
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                          ),
                          SizedBox(width: 6.sp),
                          Text(delivery,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decorationColor: Colors.white))),
                        ],
                      )
                    ],
                  ),
                ],
              ),
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
