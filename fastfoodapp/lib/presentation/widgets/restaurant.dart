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
              padding: EdgeInsets.all(SizeOfWidget.sizeOfTextH1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.sp,
                    width: double.infinity,
                    child: Listimageindicator(images: images),
                  ),
                  SizedBox(height: SizeOfWidget.sizeOfButtonLoginText),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name_restaurant,
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfText,
                              fw: FontWeight.w300)),
                      SizedBox(height: SizeOfWidget.sizeOfHeightPoint),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: SizeOfWidget.sizeOfButtonLoginText),
                            child: Text(price,
                                style: StylesOfWidgets.textStyle1(
                                    fs: SizeOfWidget.sizeOfButtonLoginText,
                                    fw: FontWeight.w400,
                                    clr: AppColors.gray)),
                          ),
                          const Point(),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeOfWidget.sizeOfHeightPoint,
                                right: SizeOfWidget.sizeOfHeightPoint),
                            child: Text(category_food,
                                style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfButtonLoginText,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeOfWidget.sizeOfHeightPoint),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(rating,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfButtonLoginText,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray)),
                          SizedBox(width: SizeOfWidget.sizeOfHeightPoint),
                          Icon(
                              // icon ngôi sao
                              Icons.star,
                              color: AppColors.primaryColor),
                          SizedBox(width: SizeOfWidget.sizeOfHeightPoint),
                          Text(comment,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfButtonLoginText,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray)),
                          SizedBox(width: SizeOfWidget.sizeOfHeightPoint),
                          const Point(),
                          SizedBox(width: SizeOfWidget.sizeOfHeightPoint),
                          Icon(
                            // icon đòng hồ
                            Icons.timer_sharp,
                            color: AppColors.gray, size: SizeOfWidget.sizeOfTextH1,
                          ),
                          Text(time,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfButtonLoginText,
                                  fw: FontWeight.w400,
                                  clr: AppColors.gray)),
                          SizedBox(width: SizeOfWidget.sizeOfHeightPoint),
                          const Point(),
                          SizedBox(width: SizeOfWidget.sizeOfHeightPoint),
                          CircleAvatar(
                            // vòng tròn chứa icon dollar
                            backgroundColor: AppColors.gray,
                            radius: SizeOfWidget.sizeOfH3,
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                              size: SizeOfWidget.sizeOfButtonLoginText,
                            ),
                          ),
                          SizedBox(width: SizeOfWidget.sizeOfPaddingHorizontal),
                          Text(delivery,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfButtonLoginText,
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
