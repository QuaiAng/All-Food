import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/models/ProductModel.dart';
import 'package:fastfoodapp/presentation/pages/detailproductscreen.dart';
import 'package:fastfoodapp/presentation/pages/detailshopscreen.dart';
import 'package:fastfoodapp/presentation/states/resultsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/states/shopviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/advertisement.dart';
import 'package:fastfoodapp/presentation/widgets/restaurant.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final shopViewModel = Provider.of<Shopviewmodel>(context);
    final productViewModel = Provider.of<Resultsearchviewmodel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vị trí hiện tại: ",
                    style: StylesOfWidgets.textStyle1(
                        fs: SizeOfWidget.sizeOfH2,
                        clr: AppColors.primaryColor,
                        fw: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.location_on,
                            color: Colors.red, size: SizeOfWidget.sizeOfH1),
                        Expanded(
                            child: Text(
                          address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH3,
                              clr: AppColors.gray,
                              fw: FontWeight.w400),
                        )),
                        Icon(
                          Icons.chevron_right,
                          color: AppColors.gray,
                          size: SizeOfWidget.sizeOfH1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      child: Listimageindicator(images: images, isShop: false),
                    ),
                  ),
                  // Gần tôi
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Gần đây",
                        style: GoogleFonts.inter(
                            fontSize: SizeOfWidget.sizeOfH1,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none),
                      )),
                      InkWell(
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
                    ],
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              5,
                              (index) => InkWell(
                                    onTap: () {},
                                    child: const Sectionfood(
                                        name_food: "Gà Rán",
                                        foodImg: "assets/images/anhga.png",
                                        foodLocation: "67, Hoàng Diệu",
                                        foodRating: 4,
                                        time: 25,
                                        delivery: "Freeship"),
                                  )))),
                  SizedBox(
                    height: 20.sp,
                  ),
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
                      InkWell(
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
                    ],
                  ),
                  SizedBox(
                    height: 70.sp,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: productViewModel.getListProductBestSeller(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text("${snapshot.error}"),
                                );
                              } else if (snapshot.hasData) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Detailproductscreen(),
                                        settings: RouteSettings(
                                            arguments: snapshot
                                                .data![index].productId),
                                      ),
                                    );
                                  },
                                  child: Sectionfood(
                                      name_food:
                                          snapshot.data![index].productName,
                                      foodImg: "assets/images/anhga.png",
                                      foodLocation:
                                          snapshot.data![index].shopAddress,
                                      foodRating: snapshot.data![index].rating,
                                      time: 25,
                                      delivery: "Freeship"),
                                );
                              } else {
                                return const Center(
                                    child: Text("Không tìm thấy dữ liệu "));
                              }
                            },
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Tất Cả Nhà Hàng",
                        style: GoogleFonts.inter(
                          fontSize: SizeOfWidget.sizeOfH1,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                      InkWell(
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
                    ],
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                            future: shopViewModel.getListShopHighRating(),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text("${snapshot.error}"),
                                );
                              } else {
                                return Restaurant(
                                  shopID: snapshot.data![index].shopId,
                                  restaurantName:
                                      snapshot.data![index].shopName,
                                  images: const [
                                    "assets/images/big.png",
                                    "assets/images/big.png",
                                    "assets/images/big.png",
                                    "assets/images/big.png"
                                  ],
                                  rating: snapshot.data![index].rating,
                                  address: snapshot.data![index].address,
                                );
                              }
                            });
                      }),
                ], // lấy cái này
              ),
            )),
      ),
    );
  }
}
