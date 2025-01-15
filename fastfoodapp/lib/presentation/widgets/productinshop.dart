import 'dart:io';

import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Productinshop extends StatelessWidget {
  final String foodName;
  final String description;
  final String imageURL;
  final double price;
  final VoidCallback onAddTap;
  const Productinshop(
      {super.key,
      required this.foodName,
      required this.onAddTap,
      required this.description,
      required this.imageURL,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.file(
                File(imageURL),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w300),
                      ),
                    ),
                    Text(
                      Formatmoney.formatCurrency(price),
                      softWrap: true,
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w700,
                          clr: AppColors.primaryColor),
                    ),
                  ],
                )),
            InkWell(
              onTap: onAddTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryColor,
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.backgroundColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
