import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/presentation/widgets/advertisement.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:fastfoodapp/presentation/widgets/sectionfood.dart';

List<String> images = [
  "assets/images/hoangtubeshop.png",
  "assets/images/hoangtubeshop.png",
  "assets/images/hoangtubeshop.png",
  "assets/images/hoangtubeshop.png",
  "assets/images/hoangtubeshop.png",
];

class Detailshopscreen extends StatefulWidget {
  const Detailshopscreen({super.key});
  @override
  State<StatefulWidget> createState() => Detailshopscreenn_State();
}

class Detailshopscreenn_State extends State<Detailshopscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Listimageindicator(images: images, isShop: true),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.backgroundColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: AppColors.backgroundColor,
                        size: 20,
                      )),
                )),
                Positioned(
                  right: 50,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: AppColors.backgroundColor,
                        size: 20,
                      )),
                )
              ],
            ),
            SizedBox(height: 15.sp),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tiệm Bánh Hoàng Tử Bé",
                      style: StylesOfWidgets.textStyle1(
                          fs: 20.sp, fw: FontWeight.bold),
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      "21 Nguyễn Thị Thập, Quận 7, TPHCM",
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w500,
                          clr: AppColors.gray),
                    ),
                    SizedBox(height: 15.sp),
                    Row(
                      children: [
                        Text(
                          "4.3",
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH4,
                              fw: FontWeight.w500,
                              clr: AppColors.gray),
                        ),
                        SizedBox(
                            width: 25.sp,
                            child: const Icon(Icons.star,
                                color: AppColors.primaryColor, size: 16)),
                        SizedBox(
                          width: 40.sp,
                          child: Text(
                            "200+ ratings",
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH4,
                                fw: FontWeight.w500,
                                clr: AppColors.gray),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.sp),
                    Text(
                      "Featured Items",
                      style: StylesOfWidgets.textStyle1(
                          fs: 19.sp, fw: FontWeight.w300),
                    ),
                    SizedBox(height: 15.sp),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            5,
                            (index) => InkWell(
                                  onTap: () {},
                                  child: const Sectionfood(
                                      name_food: "Gà Rán",
                                      foodImg: "assets/images/anhga.png",
                                      foodLocation: "21 Nguyễn Thị Thập",
                                      foodRating: 4.3,
                                      time: 25,
                                      delivery: "Freeship"),
                                )))),
              ),
              SizedBox(height: 15.sp),
              // TabBar(tabs: )
            ])
          ]),
        ),
      ),
    );
  }
}
