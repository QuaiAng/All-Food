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
      required this.restaurantName,
      required this.images,
      required this.price,
      required this.category,
      required this.rating,
      required this.comment,
      required this.time,
      required this.delivery});

  final String restaurantName;
  final List<String> images;
  final String price;
  final String category;
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
                  SizedBox(height: SizeOfWidget.sizeOfH4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurantName,
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w300)),
                      SizedBox(height: 10.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: SizeOfWidget.sizeOfH4),
                            child: Text(price,
                                style: StylesOfWidgets.textStyle1(
                                    fs: SizeOfWidget.sizeOfH4,
                                    fw: FontWeight.w400,
                                    clr: AppColors.gray)),
                          ),
                          const Point(),
                          Padding(
                            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                            child: Text(category,
                                style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH4,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(rating,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH4,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray)),
                          SizedBox(width: 10.sp),
                          Icon(
                              // icon ngôi sao
                              Icons.star,
                              color: AppColors.primaryColor),
                          SizedBox(width: 10.sp),
                          Text(comment,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH4,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray)),
                          SizedBox(width: 10.sp),
                          const Point(),
                          SizedBox(width: 10.sp),
                          Icon(
                            // icon đòng hồ
                            Icons.timer_sharp,
                            color: AppColors.gray,
                            size: 20.sp,
                          ),
                          Text(time,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH4,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray)),
                          SizedBox(width: 10.sp),
                          const Point(),
                          SizedBox(width: 10.sp),
                          CircleAvatar(
                            // vòng tròn chứa icon dollar
                            backgroundColor: AppColors.gray,
                            radius: SizeOfWidget.sizeOfH3,
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                              size: SizeOfWidget.sizeOfH4,
                            ),
                          ),
                          SizedBox(width: 4.sp),
                          Text(delivery,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH4,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray)),
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
          const BoxDecoration(color: AppColors.gray, shape: BoxShape.circle),
    );
  }
}
