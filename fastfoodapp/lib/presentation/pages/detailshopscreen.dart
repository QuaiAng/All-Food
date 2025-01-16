import 'package:fastfoodapp/data/models/CartDetailModel.dart';
import 'package:fastfoodapp/presentation/pages/detailproductscreen.dart';
import 'package:fastfoodapp/presentation/states/cartviewmodel.dart';
import 'package:fastfoodapp/presentation/states/categoryviewmodel.dart';
import 'package:fastfoodapp/presentation/states/resultsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/states/shopviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/productinshop.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/presentation/widgets/advertisement.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:provider/provider.dart';
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
    final cartViewModel = Provider.of<Cartviewmodel>(context);
    final categoryViewModel = Provider.of<Categoryviewmodel>(context);
    final productViewModel = Provider.of<Resultsearchviewmodel>(context);
    final shopId = ModalRoute.of(context)?.settings.arguments as int;
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
                  future: shopViewModel.getShopByShopID(shopId),
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

                          //Phần load sản phẩm
                          SizedBox(height: 20.sp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            child: const Divider(
                              thickness: 0.5,
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.sp),
                            child: Text(
                              "Được đánh giá cao nhất",
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH1,
                                  fw: FontWeight.w300),
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
                                      future: productViewModel
                                          .getListProductBestSeller(),
                                      builder: (context, productSnapshot) {
                                        if (productSnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (productSnapshot.hasError) {
                                          return Center(
                                            child: Text(
                                                "${productSnapshot.error}"),
                                          );
                                        } else if (productSnapshot.hasData) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Detailproductscreen(),
                                                  settings: RouteSettings(
                                                      arguments: productSnapshot
                                                          .data![index]
                                                          .productId),
                                                ),
                                              );
                                            },
                                            child: Sectionfood(
                                                name_food: productSnapshot
                                                    .data![index].productName,
                                                foodImg:
                                                    "foodimage/banhmi1.jpg",
                                                foodLocation: productSnapshot
                                                    .data![index].shopAddress,
                                                foodRating: productSnapshot
                                                    .data![index].rating,
                                                time: 25,
                                                delivery: "Freeship"),
                                          );
                                        } else {
                                          return const Center(
                                              child: Text(
                                                  "Không tìm thấy dữ liệu "));
                                        }
                                      },
                                    );
                                  }),
                            ),
                          ),

                          //Phần load loại
                          SizedBox(height: 15.sp),
                          Column(
                            children: [
                              FutureBuilder(
                                future: categoryViewModel.getCategoriesByShopId(
                                    snapshot.data!.shopId),
                                builder: (context, categorySnapshot) {
                                  if (categorySnapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (categorySnapshot.hasError) {
                                    return Center(
                                      child: Text("${categorySnapshot.error}"),
                                    );
                                  } else if (categorySnapshot.hasData) {
                                    TabController tabController = TabController(
                                        length: categorySnapshot.data!.length,
                                        vsync: this);
                                    return Column(
                                      children: [
                                        SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: TabBar(
                                                tabAlignment:
                                                    TabAlignment.start,
                                                labelStyle:
                                                    StylesOfWidgets.textStyle1(
                                                        fs: SizeOfWidget
                                                            .sizeOfH1,
                                                        fw: FontWeight.w600),
                                                unselectedLabelStyle:
                                                    StylesOfWidgets.textStyle1(
                                                        fs: SizeOfWidget
                                                            .sizeOfH1,
                                                        fw: FontWeight.w600),
                                                controller: tabController,
                                                indicator:
                                                    const BoxDecoration(),
                                                dividerHeight: 0,
                                                labelColor: Colors.black,
                                                unselectedLabelColor:
                                                    Colors.grey,
                                                isScrollable:
                                                    true, // Cho phép cuộn ngang
                                                tabs: List.generate(
                                                  categorySnapshot.data!.length,
                                                  (index) {
                                                    return Text(categorySnapshot
                                                        .data![index]
                                                        .categoryName);
                                                  },
                                                ))),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5, // Chiều cao tùy chỉnh
                                          child: TabBarView(
                                            controller: tabController,
                                            children: List.generate(
                                              categorySnapshot.data!.length,
                                              (index) {
                                                return FutureBuilder(
                                                  future: productViewModel
                                                      .getProducsByCategoryId(
                                                          categorySnapshot
                                                              .data![index]
                                                              .categoryId),
                                                  builder: (context,
                                                      productWithCategorySnapshot) {
                                                    if (productWithCategorySnapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    } else if (productWithCategorySnapshot
                                                        .hasError) {
                                                      return Center(
                                                        child: Text(
                                                            "${productWithCategorySnapshot.error}"),
                                                      );
                                                    } else if (productWithCategorySnapshot
                                                        .hasData) {
                                                      return ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount:
                                                            productWithCategorySnapshot
                                                                .data!.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.sp),
                                                            child:
                                                                Productinshop(
                                                                    onAddTap:
                                                                        () async {
                                                                      var cart =
                                                                          await cartViewModel
                                                                              .getCartByUserId();
                                                                      var product = await productViewModel.getProductByProductId(productWithCategorySnapshot
                                                                          .data![
                                                                              index]
                                                                          .productId);
                                                                      // var product = await resultSearchViewModel.getProductByProductId(productId);
                                                                      var cartDetail = Cartdetailmodel(
                                                                          cartId: cart!
                                                                              .cartId,
                                                                          productId: product
                                                                              .productId,
                                                                          quantity:
                                                                              1,
                                                                          price:
                                                                              0,
                                                                          shopId: product
                                                                              .shopId,
                                                                          description:
                                                                              "",
                                                                          productName:
                                                                              "",
                                                                          productImageurl:
                                                                              "",
                                                                          shopName:
                                                                              "");
                                                                      await cartViewModel
                                                                          .addToCart(
                                                                              cartDetail)
                                                                          .then(
                                                                        (value) {
                                                                          String result = value
                                                                              ? "Thêm thành công"
                                                                              : "Thêm thất bại";
                                                                          var snackBar =
                                                                              SnackBar(
                                                                            content:
                                                                                Text(
                                                                              result,
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                            backgroundColor: value
                                                                                ? Colors.green
                                                                                : Colors.red,
                                                                          );
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(snackBar);
                                                                        },
                                                                      );
                                                                    },
                                                                    imageURL: productWithCategorySnapshot
                                                                        .data![
                                                                            index]
                                                                        .imageURL,
                                                                    foodName: productWithCategorySnapshot
                                                                        .data![
                                                                            index]
                                                                        .productName,
                                                                    description: productWithCategorySnapshot
                                                                        .data![
                                                                            index]
                                                                        .description,
                                                                    price: productWithCategorySnapshot
                                                                            .data![index]
                                                                            .price *
                                                                        1.0),
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      return const Center(
                                                          child: Text(
                                                              "Không tìm thấy loại"));
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const Center(
                                        child: Text("Không tìm thấy loại"));
                                  }
                                },
                              ),
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
            ])
          ]),
        ),
      ),
    );
  }
}
