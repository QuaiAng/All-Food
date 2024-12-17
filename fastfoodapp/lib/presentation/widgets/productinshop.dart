import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Productinshop extends StatelessWidget {
  const Productinshop({super.key});

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
              child: Image.asset(
                Imagepath.food,
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
                      "Combo Burger",
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        "Shortbread, chocolate turtle cookies, and red velvet.",
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w300),
                      ),
                    ),
                    Text(
                      Formatmoney.formatCurrency(56000),
                      softWrap: true,
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w700,
                          clr: AppColors.primaryColor),
                    ),
                  ],
                )),
            InkWell(
              onTap: () {},
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
