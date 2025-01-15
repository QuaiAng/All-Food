import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/widgets/advertisement.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'dart:core';

class Restaurant extends StatelessWidget {
  const Restaurant(
      {super.key,
      required this.restaurantName,
      required this.images,
      required this.rating,
      required this.address,
      required this.shopID,
      required this.onTap});

  final String restaurantName;
  final List<String> images;
  final double rating;
  final String address;
  final int shopID;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.sp,
                  width: double.infinity,
                  child: Listimageindicator(images: images, isShop: false),
                ),
                SizedBox(height: SizeOfWidget.sizeOfH4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurantName,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w300)),
                    SizedBox(height: 8.sp),
                    Wrap(
                      spacing: 10.sp, // Khoảng cách giữa các phần tử trong wrap
                      runSpacing: 10.sp, // Khoảng cách giữa các dòng
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text('${rating}',
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH4,
                                fw: FontWeight.w400,
                                clr: AppColors.gray)),
                        Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                          size: SizeOfWidget.sizeOfH3,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.placeholderColor,
                      size: 18.sp,
                    ),
                    Text(address,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH4,
                            fw: FontWeight.w400,
                            clr: AppColors.gray)),
                  ],
                )
              ],
            ),
          ),
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
          const BoxDecoration(color: AppColors.gray, shape: BoxShape.circle),
    );
  }
}
