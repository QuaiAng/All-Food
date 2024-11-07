import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Productfilter extends StatelessWidget {
  const Productfilter(
      {super.key,
      required this.shopName,
      required this.address,
      required this.onTap,
      required this.time,
      required this.fee,
      required this.rating});
  final String shopName;
  final String address;
  final String time;
  final String fee;
  final String rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    final parentWidth = constraints.maxWidth;
                    final parentHeight = constraints.maxHeight;

                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/images/bg.png",
                          fit: BoxFit.fill,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8)),
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Positioned(
                            bottom:
                                parentHeight * 0.05, // 5% chiều cao của thẻ cha
                            left:
                                parentWidth * 0.05, // 5% chiều rộng của thẻ cha
                            child: Row(
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  size: parentHeight * 0.1,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: parentWidth * 0.01,
                                ),
                                Text(
                                  fee,
                                  style: StylesOfWidgets.textStyle1(
                                      fs: parentHeight * 0.05,
                                      clr: Colors.white),
                                ),
                              ],
                            )),
                        Positioned(
                            bottom:
                                parentHeight * 0.2, // 5% chiều cao của thẻ cha
                            left:
                                parentWidth * 0.05, // 5% chiều rộng của thẻ cha
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delivery_dining,
                                  size: parentHeight * 0.1,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: parentWidth * 0.01,
                                ),
                                Text(
                                  time,
                                  style: StylesOfWidgets.textStyle1(
                                      fs: parentHeight * 0.05,
                                      clr: Colors.white),
                                ),
                              ],
                            )),
                        Positioned(
                            bottom:
                                parentHeight * 0.05, // 5% chiều cao của thẻ cha
                            right:
                                parentWidth * 0.05, // 5% chiều rộng của thẻ cha
                            child: Container(
                                alignment: Alignment.center,
                                width: parentHeight * 0.15,
                                height: parentWidth * 0.11,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Text(
                                  rating,
                                  textAlign: TextAlign.center,
                                  style: StylesOfWidgets.textStyle1(
                                    fs: parentHeight * 0.053,
                                    fw: FontWeight.bold,
                                    clr: Colors.white,
                                  ),
                                ))),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.sp,
          ),
          Text(
            shopName,
            style: StylesOfWidgets.textStyle1(
                fs: SizeOfWidget.sizeOfH1, clr: Colors.black),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Text(
            address,
            style: StylesOfWidgets.textStyle1(
                fs: SizeOfWidget.sizeOfH2, clr: AppColors.gray),
          ),
        ],
      ),
    );
  }
}
