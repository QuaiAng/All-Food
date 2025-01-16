import 'dart:io';

import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/models/CartDetailModel.dart';
import 'package:fastfoodapp/presentation/states/cartviewmodel.dart';
import 'package:fastfoodapp/presentation/states/categoryviewmodel.dart';
import 'package:fastfoodapp/presentation/states/detailproductscreenviewmodel.dart';
import 'package:fastfoodapp/presentation/states/resultsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/states/reviewviewmodel.dart';
import 'package:fastfoodapp/presentation/states/shopviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/presentation/widgets/feedback.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/strings.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Detailproductscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as int;

    final categoryViewModel = Provider.of<Categoryviewmodel>(context);
    final cartViewModel = Provider.of<Cartviewmodel>(context);
    final detailproductscreenViewModel =
        Provider.of<Detailproductscreenviewmodel>(
            context); // xử lí nút bấm tăng giảm trong màn hình
    final resultSearchViewModel = Provider.of<Resultsearchviewmodel>(context);
    final shopViewModel = Provider.of<Shopviewmodel>(
        context); // lấy thông tin shop bán sản phẩm đó

    final reviewViewModel = Provider.of<Reviewviewmodel>(
        context); // lấy đánh giá và rating của sản phẩm
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: resultSearchViewModel.getProductByProductId(productId),
              builder: (BuildContext context, productSnapShot) {
                if (productSnapShot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (productSnapShot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            // hình nền
                            height: 60.sp,
                            width: double.infinity,
                            child: Image.network(
                              "${AppStrings.urlAPI}/${productSnapShot.data!.imageURL}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 18.sp,
                            left: 18.sp,
                            // icon quay trở lại
                            child: IconButton(
                                onPressed: () {
                                  detailproductscreenViewModel.resetQuantity();
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios,
                                    size: 21.sp, color: AppColors.gray)),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productSnapShot.data!.productName,
                                style: StylesOfWidgets.textStyle1(
                                    fs: 20.sp,
                                    fw: FontWeight.bold,
                                    clr: Colors.black),
                              ),
                              SizedBox(
                                height: 15.sp,
                              ),
                              SizedBox(
                                width: 159.sp,
                                child: Text(
                                  productSnapShot.data!.description,
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
                              FutureBuilder(
                                future:
                                    categoryViewModel.getCategoryByCategoryId(
                                        productSnapShot.data!.categoryId),
                                builder:
                                    (BuildContext context, categorySnapShot) {
                                  if (categorySnapShot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (categorySnapShot.hasData) {
                                    return Text(
                                      categorySnapShot.data!,
                                      style: StylesOfWidgets.textStyle1(
                                          fs: 16.sp,
                                          fw: FontWeight.w400,
                                          clr: AppColors.placeholderColor),
                                    );
                                  } else {
                                    return const Center(
                                        child: Text("Không tìm thấy dữ liệu"));
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15.sp,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${productSnapShot.data!.rating * 1.0}",
                                    style: StylesOfWidgets.textStyle1(
                                        fs: SizeOfWidget.sizeOfH3,
                                        fw: FontWeight.normal,
                                        clr: AppColors.gray),
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: AppColors.primaryColor,
                                    size: 17.sp,
                                  ),
                                  Text(
                                    "| ${productSnapShot.data!.salesCount} lượt bán",
                                    style: StylesOfWidgets.textStyle1(
                                        fs: SizeOfWidget.sizeOfH3,
                                        fw: FontWeight.normal,
                                        clr: AppColors.gray),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          Formatmoney.formatCurrency(
                                              double.parse(productSnapShot
                                                  .data!.price
                                                  .toString())),
                                          style: StylesOfWidgets.textStyle1(
                                              clr: AppColors.primaryColor,
                                              fs: SizeOfWidget.sizeOfH2,
                                              fw: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              //phần dành cho Shop bán hàng
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.sp, horizontal: 10.sp),
                                  child: FutureBuilder(
                                    future: shopViewModel.getShopByShopID(
                                        productSnapShot.data!.shopId),
                                    builder: (BuildContext context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (snapshot.hasError) {
                                        return Center(
                                            child:
                                                Text("Lỗi: ${snapshot.error}"));
                                      } else if (snapshot.hasData) {
                                        return Column(
                                          children: [
                                            /// phần product tới đây
                                            SizedBox(
                                              height: 16.sp,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.sp,
                                                  vertical: 15.sp),
                                              child: Divider(
                                                height: 0.5.sp,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CircleAvatar(
                                                  radius: 20.sp,
                                                  backgroundImage: NetworkImage(
                                                    "${AppStrings.urlAPI}/${snapshot.data!.imageURL}",
                                                  ),
                                                ),
                                                SizedBox(width: 20.sp),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.data!.shopName,
                                                        style: StylesOfWidgets
                                                            .textStyle1(
                                                                fs: SizeOfWidget
                                                                    .sizeOfH2,
                                                                fw: FontWeight
                                                                    .w500,
                                                                clr: Colors
                                                                    .black),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${snapshot.data!.rating}",
                                                            style: StylesOfWidgets
                                                                .textStyle1(
                                                                    fs: 15.sp,
                                                                    fw: FontWeight
                                                                        .normal,
                                                                    clr: AppColors
                                                                        .gray),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .star_rate_rounded,
                                                            color: AppColors
                                                                .primaryColor,
                                                            size: 18.sp,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      width: 28.sp,
                                                      height: 28.sp,
                                                      decoration: BoxDecoration(
                                                        color: Colors.pink
                                                            .withOpacity(0.05),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 22.sp,
                                                      height: 22.sp,
                                                      decoration: BoxDecoration(
                                                        color: Colors.amber,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .mark_unread_chat_alt_rounded,
                                                        color: Colors.white,
                                                        size: 17.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 14.sp),
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      width: 28.sp,
                                                      height: 28.sp,
                                                      decoration: BoxDecoration(
                                                        color: Colors.pink
                                                            .withOpacity(0.05),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 22.sp,
                                                      height: 22.sp,
                                                      decoration: BoxDecoration(
                                                        color: Colors.amber,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Icon(
                                                        Icons.call,
                                                        color: Colors.white,
                                                        size: 17.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.sp,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.sp,
                                                  vertical: 10.sp),
                                              child: Divider(
                                                height: 0.5.sp,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Center(
                                            child: Text("Không có dữ liệu"));
                                      }
                                    },
                                  )),
                            ]),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text("Không tìm thấy dữ liệu"));
                }
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Text(
                "ĐÁNH GIÁ CỦA KHÁCH HÀNG",
                style: StylesOfWidgets.textStyle1(
                    fs: SizeOfWidget.sizeOfH2,
                    fw: FontWeight.w500,
                    clr: AppColors.gray),
              ),
            ),
            // phần dành cho review
            SizedBox(
              width: 100.sp,
              height: 90.sp,
              child: FutureBuilder(
                future: reviewViewModel.getListReviewByProductId(productId),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Comment(
                                rating: snapshot.data![index].rating,
                                nameUser: snapshot.data![index].fullName,
                                image: Imagepath.food,
                                feedback: snapshot.data![index].comment),
                          ]);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          height: 50.sp,
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 29.sp,
                      height: 29.sp,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // nút nhấn tăng, tăng sản phẩm đã chọn
                          detailproductscreenViewModel.btnHigh();
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Text(
                      detailproductscreenViewModel.quantity.toString(),
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 22.sp)),
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Container(
                      width: 29.sp,
                      height: 29.sp,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            // nút dấu trừ , giảm sản phẩm
                            detailproductscreenViewModel.btnLow();
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Buttonlogin(
                  onClick: () async {
                    bool isLoggedIn = await cartViewModel.checkUserLoggedIn();
                    if (isLoggedIn) {
                      var cart = await cartViewModel.getCartByUserId();
                      var product = await resultSearchViewModel
                          .getProductByProductId(productId);
                      var cartDetail = Cartdetailmodel(
                        cartId: cart!.cartId,
                        productId: product.productId,
                        quantity: detailproductscreenViewModel.quantity,
                        price: 0,
                        shopId: product.shopId,
                        description: "",
                        productName: "",
                        productImageurl: "",
                        shopName: "",
                      );
                      await cartViewModel.addToCart(cartDetail).then(
                        (value) {
                          String result =
                              value ? "Thêm thành công" : "Thêm thất bại";
                          var snackBar = SnackBar(
                            content: Text(
                              result,
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: value ? Colors.green : Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      );
                    } else {
                      // Hiển thị thông báo yêu cầu đăng nhập
                      var snackBar = SnackBar(
                        content: Text(
                          "Vui lòng đăng nhập để thêm vào giỏ hàng",
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: AppColors.primaryColor,
                        action: SnackBarAction(
                          label: "Đăng nhập",
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, RouteName.loginScreen);
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  text: "THÊM VÀO GIỎ HÀNG",
                )
              ],
            ),
          )),
    );
  }
}
