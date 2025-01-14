import 'package:fastfoodapp/presentation/pages/detailproductscreen.dart';
import 'package:fastfoodapp/presentation/states/resultsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/states/shopviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/productinshop.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/presentation/widgets/advertisement.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class Detailshopscreenn_State extends State<Detailshopscreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final shopViewModel = Provider.of<Shopviewmodel>(context);
    final productViewModel = Provider.of<Resultsearchviewmodel>(context);

    TabController _tabController = TabController(length: 6, vsync: this);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                child: FutureBuilder(
                  future: shopViewModel.getShopByShopID(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.shopName,
                            style: StylesOfWidgets.textStyle1(
                                fs: 20.sp, fw: FontWeight.w600),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            snapshot.data!.address,
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH3,
                                fw: FontWeight.w500,
                                clr: AppColors.gray),
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            children: [
                              Text(
                                "${snapshot.data!.rating}",
                                style: StylesOfWidgets.textStyle1(
                                    fs: SizeOfWidget.sizeOfH4,
                                    fw: FontWeight.w500,
                                    clr: AppColors.gray),
                              ),
                              SizedBox(
                                  width: 25.sp,
                                  child: const Icon(Icons.star,
                                      color: AppColors.primaryColor, size: 16)),
                              // SizedBox(
                              //   width: 40.sp,
                              //   child: Text(
                              //     "200+ ratings",
                              //     style: StylesOfWidgets.textStyle1(
                              //         fs: SizeOfWidget.sizeOfH4,
                              //         fw: FontWeight.w500,
                              //         clr: AppColors.gray),
                              //   ),
                              // )
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Text("Không tìm thấy dữ liệu");
                    }
                  },
                ),
              ),
              SizedBox(height: 20.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: Text(
                  "Được đánh giá cao nhất",
                  style: StylesOfWidgets.textStyle1(
                      fs: 19.sp, fw: FontWeight.w300),
                ),
              ),
              SizedBox(height: 15.sp),
              Padding(
                padding: EdgeInsets.zero,
                child: SizedBox(
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
                                          arguments:
                                              snapshot.data![index].productId),
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
              ),
              SizedBox(height: 15.sp),
              Column(
                children: [
                  // TabBar trong SingleChildScrollView để có thể cuộn ngang
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      labelStyle: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w600),
                      unselectedLabelStyle: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w600),
                      controller: _tabController,
                      indicator: const BoxDecoration(),
                      dividerHeight: 0,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true, // Cho phép cuộn ngang
                      tabs: const [
                        Tab(text: "Lẩu"),
                        Tab(text: "Ăn vặt"),
                        Tab(text: "Món nướng"),
                        Tab(text: "Món nước"),
                        Tab(text: "Mì"),
                        Tab(text: "Hải sản"),
                      ],
                    ),
                  ),
                  // Đảm bảo TabBarView chiếm toàn bộ không gian còn lại
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.5, // Chiều cao tùy chỉnh
                    child: TabBarView(
                      controller: _tabController,
                      children: List.generate(
                        6,
                        (index) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.sp),
                                child: const Productinshop(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
