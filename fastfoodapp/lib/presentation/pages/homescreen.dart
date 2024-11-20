import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/presentation/widgets/advertisement.dart';
import 'package:fastfoodapp/presentation/widgets/restaurant.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fastfoodapp/presentation/widgets/sectionfood.dart';

List<String> images = [
  "assets/images/big.png",
  "assets/images/anhcam.png",
  "assets/images/big.png",
  "assets/images/anhcam.png",
  "assets/images/big.png",
];

class Homescreen extends StatelessWidget {
  const Homescreen({required this.address});

  final String address;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Địa điểm của tôi: ",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: SizeOfWidget.sizeOfButtonLoginText,
                        fontWeight: FontWeight.w300,
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.none),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: SizeOfWidget.sizeOfH1,
                        ),
                        Expanded(
                          child: Text(
                            address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                fontSize: SizeOfWidget.sizeOfButtonLoginText,
                                fontWeight: FontWeight.w200,
                                color: AppColors.gray,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_right,
                        color: AppColors.gray,
                        size: 17.sp,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: Listimageindicator(images: images),
                  ),
                ),
                // Gần tôi
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Gần Tôi",
                      style: GoogleFonts.inter(
                          fontSize: 19.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none),
                    )),
                    Material(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "Xem tất cả",
                              style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: AppColors.primaryColor),
                            ),
                            SizedBox(width: 2.sp),
                            Icon(
                              Icons.chevron_right,
                              color: AppColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                        5,
                        (index) => Sectionfood(
                            name_food: "name_food",
                            foodImg: "foodImg",
                            foodLocation: "foodLocation",
                            foodStart: 4.3,
                            foodRating: "foodRating"),
                      ))),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Best Seller",
                      style: GoogleFonts.inter(
                          fontSize: 19.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration.none),
                    )),
                    Material(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "Xem tất cả",
                              style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: AppColors.primaryColor),
                            ),
                            SizedBox(width: 2.sp),
                            const Icon(
                              Icons.chevron_right,
                              color: AppColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                        5,
                        (index) => Sectionfood(
                            name_food: "name_food",
                            foodImg: "foodImg",
                            foodLocation: "foodLocation",
                            foodStart: 4.3,
                            foodRating: "foodRating"),
                      ))),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Tất Cả Nhà Hàng ",
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none),
                    )),
                    Material(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "Xem tất cả",
                              style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: AppColors.primaryColor),
                            ),
                            SizedBox(width: 2.sp),
                            const Icon(
                              Icons.chevron_right,
                              color: AppColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                      children: List.generate(
                          5,
                          (index) => Restaurant(
                              name_restaurant: "McDonal's",
                              images: [
                                "assets/images/big.png",
                                "assets/images/big.png",
                                "assets/images/big.png",
                                "assets/images/big.png"
                              ],
                              price: "10k - 99k",
                              category_food: "BURGERS",
                              rating: "4.3",
                              comment: "200+ Đánh giá",
                              time: "25 min",
                              delivery: "Deshi food"))),
                ),
              ], // lấy cái này
            )));
  }
}
