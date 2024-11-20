import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Itemincart extends StatelessWidget {
  const Itemincart(
      {super.key,
      required this.onTap,
      required this.image,
      required this.name,
      required this.note,
      required this.price,
      required this.quantity});
  final VoidCallback onTap;
  final String image;
  final String name;
  final String note;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1/3 Row cho ảnh
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),

          // 2/3 Row cho text
          SizedBox(width: 15.sp),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w400),
                ),
                Text(
                  note,
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3,
                      fw: FontWeight.w400,
                      clr: AppColors.gray),
                ),
                SizedBox(height: 15.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: AppColors.primaryColor,
                                size: 20.sp,
                              )),
                          Text(
                            quantity.toString(),
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH3),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: AppColors.primaryColor,
                                size: 20.sp,
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          Formatmoney.formatCurrency(price),
                          softWrap: true,
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH3,
                              fw: FontWeight.w700,
                              clr: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
