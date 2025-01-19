import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/productwatting.dart';

class Waitingforapprovalsection extends StatelessWidget {
  final VoidCallback onAccept;
  final VoidCallback onCancel;
  final String productName;
  final String shopName;
  final int price;

  const Waitingforapprovalsection({
    super.key,
    required this.productName,
    required this.shopName,
    required this.price,
    required this.onAccept,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/images/bg.png",
              width: 48.sp,
              height: 53.sp,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: StylesOfWidgets.textStyle1(
                      clr: Colors.black,
                      fs: SizeOfWidget.sizeOfH1,
                      fw: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  children: [
                    Text(
                      'Của ',
                      style: StylesOfWidgets.textStyle1(
                        clr: AppColors.gray,
                        fs: SizeOfWidget.sizeOfH3,
                      ),
                    ),
                    Text(
                      shopName,
                      style: StylesOfWidgets.textStyle1(
                          clr: AppColors.primaryColor,
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  Formatmoney.formatCurrency(double.parse(price.toString())),
                  style: StylesOfWidgets.textStyle1(
                      clr: AppColors.primaryColor,
                      fs: SizeOfWidget.sizeOfH3,
                      fw: FontWeight.w600),
                ),
                SizedBox(
                  height: 16.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: onAccept,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          minimumSize: Size(22.sp, 28.sp)),
                      child: Text(
                        'XÁC NHẬN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeOfWidget.sizeOfH3),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: onCancel,
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.orange,
                          side: const BorderSide(
                              color: Colors.orange, width: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          minimumSize: Size(20.sp, 28.sp)),
                      child: const Text('HUỶ'),
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
