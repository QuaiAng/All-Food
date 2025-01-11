import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/presentation/widgets/feedback.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Detailproductscreen extends StatelessWidget {
  Detailproductscreen(
      {required this.image,
      required this.nameFood,
      required this.categoryFoodName,
      required this.comment,
      required this.rating,
      required this.quantity});

  late String image;
  late String categoryFoodName;
  late String nameFood;
  late String comment;
  late double rating;
  late int quantity;
  final List<String> images = [
    "assets/images/anhchandung.jpg",
    "assets/images/anhchandung.png",
    "assets/images/anhchandung.jpg",
    "assets/images/anhchandung2.jpg",
    "assets/images/anhchandung.jpg",
    "assets/images/anhchandung2.jpg",
    "assets/images/anhchandung2.jpg",
    "assets/images/anhchandung2.jpg",
    "assets/images/anhchandung2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                // hình nền
                height: 60.sp,
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 18.sp,
                left: 18.sp,
                // icon quay trở lại
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios,
                        size: 21.sp, color: AppColors.gray)),
              )
            ],
          ),
          Container(
            color: AppColors.backgroundColor,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameFood,
                  style: StylesOfWidgets.textStyle1(
                      fs: 20.sp, fw: FontWeight.bold, clr: Colors.black),
                ),
                SizedBox(
                  height: 17.sp,
                ),
                SizedBox(
                  width: 159.sp,
                  child: Text(
                    comment,
                    softWrap: true,
                    style: StylesOfWidgets.textStyle1(
                        fs: SizeOfWidget.sizeOfH3,
                        fw: FontWeight.w300,
                        clr: AppColors.gray),
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Text(
                  categoryFoodName,
                  style: StylesOfWidgets.textStyle1(
                      fs: 16.sp,
                      fw: FontWeight.w400,
                      clr: AppColors.placeholderColor),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${rating}",
                      style: StylesOfWidgets.textStyle1(
                          fs: 14.sp,
                          fw: FontWeight.normal,
                          clr: AppColors.gray),
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.primaryColor,
                      size: 17.sp,
                    ),
                    Text(
                      "| ${quantity} lượt bán",
                      style: StylesOfWidgets.textStyle1(
                          fs: 14.sp,
                          fw: FontWeight.normal,
                          clr: AppColors.gray),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.sp,
                ),
                Divider(),
                SizedBox(
                  height: 17.sp,
                ),
                Text(
                  "ĐÁNH GIÁ CỦA KHÁCH HÀNG",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH2,
                      fw: FontWeight.w500,
                      clr: AppColors.gray),
                ),
                SizedBox(
                  height: 17.sp,
                ),
                SizedBox(
                  width: 100.sp,
                  height: 100.sp,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          Comment(
                              image: images[index + 2],
                              nameUser: "Tran Thi Ngoc Can",
                              feedback:
                                  "Shortbread, chocolate turtle cookies, and red velvet, Shortbread, chocolate turtle cookies, and red velvet"),
                        ]);
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
