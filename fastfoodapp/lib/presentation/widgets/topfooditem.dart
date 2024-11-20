import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Topfooditem extends StatelessWidget {
  const Topfooditem(
      {super.key,
      required this.foodName,
      required this.price,
      required this.address,
      required this.image,
      required this.onTap});
  final String image;
  final String foodName;
  final String price;
  final String address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            children: [
              Text(
                foodName,
                style: StylesOfWidgets.textStyle1(
                    clr: Colors.black, fs: SizeOfWidget.sizeOfH1),
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            children: [
              Text(
                "$price - ",
                style: StylesOfWidgets.textStyle1(
                    clr: AppColors.gray, fs: SizeOfWidget.sizeOfH3),
              ),
              Text(
                "$address",
                style: StylesOfWidgets.textStyle1(
                    clr: AppColors.gray, fs: SizeOfWidget.sizeOfH3),
              ),
            ],
          )
        ],
      ),
    );
  }
}
