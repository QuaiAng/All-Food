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
  const Homescreen({super.key, required this.address});

  final String address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(SizeOfWidget.sizeOfH3),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Địa điểm của tôi: ",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH4,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.location_on,
                        color: Colors.red, size: SizeOfWidget.sizeOfH1),
                    Expanded(
                        child: Text(
                      address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: SizeOfWidget.sizeOfH3,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                    )),
                    IconButton(
                      onPressed: () {
                        // thực hiện chuyển trang
                      },
                      icon: Icon(
                        Icons.chevron_right,
                        color: AppColors.gray,
                        size: SizeOfWidget.sizeOfH1,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
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
                          fontSize: SizeOfWidget.sizeOfH1,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none),
                    )),
                    Material(
                      child: InkWell(
                        onTap: () {
                          // chuyển trang qua trang chi tiết món ăn
                        },
                        child: Row(
                          children: [
                            Text(
                              "Xem tất cả",
                              style: GoogleFonts.inter(
                                  fontSize: SizeOfWidget.sizeOfH3,
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
                SizedBox(
                    height: 70.sp,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Sectionfood(
                                name_food: "Gà Rán",
                                foodImg: "assets/images/anhga.png",
                                foodLocation: "67, Hoàng Diệu",
                                foodRating: 4.3,
                                time: 25,
                                delivery: "Freeship"),
                          );
                        })),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Best Seller",
                      style: GoogleFonts.inter(
                        fontSize: SizeOfWidget.sizeOfH1,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                    Material(
                      child: InkWell(
                        onTap: () {
                          // xử lí chuyển trang
                        },
                        child: Row(
                          children: [
                            Text(
                              "Xem tất cả",
                              style: GoogleFonts.inter(
                                  fontSize: SizeOfWidget.sizeOfH3,
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
                    height: 70.sp,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Sectionfood(
                                name_food: "Gà Rán",
                                foodImg: "assets/images/anhga.png",
                                foodLocation: "67, Hoàng Diệu",
                                foodRating: 4.3,
                                time: 25,
                                delivery: "Freeship"),
                          );
                        })),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Tất Cả Nhà Hàng",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                    Material(
                      child: InkWell(
                        onTap: () {
                          // xử lí chuyển trang
                        },
                        child: Row(
                          children: [
                            Text(
                              "Xem tất cả",
                              style: GoogleFonts.inter(
                                  fontSize: SizeOfWidget.sizeOfH3,
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
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Restaurant(
                              restaurantName: "McDonal's",
                              images: [
                                "assets/images/big.png",
                                "assets/images/big.png",
                                "assets/images/big.png",
                                "assets/images/big.png"
                              ],
                              price: "10k - 99k",
                              category: "BURGERS",
                              rating: "4.3",
                              comment: "200+ Đánh giá",
                              time: "25 min",
                              delivery: "Deshi food"),
                        );
                      }),
                ),
              ], // lấy cái này
            ),
          )),
    );
  }
}
