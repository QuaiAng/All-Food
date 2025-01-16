import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/pages/detailproductscreen.dart';
import 'package:fastfoodapp/presentation/states/cartviewmodel.dart';
import 'package:fastfoodapp/presentation/states/detailproductscreenviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/itemincart.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// List items = List.generate(12, (index) {
//   return Itemincart(
//     onTap: () {},
//     image: 'assets/images/food.png',
//     name: "McDonald's",
//     note: "Đây là ghi chú Đây là ghi chú Đây là ghi chú Đây ",
//     price: 56000.0,
//     quantity: 8,
//   );
// });

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cartViewModel = Provider.of<Cartviewmodel>(context, listen: true);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: AppColors.backgroundColor,
      //   surfaceTintColor: AppColors.backgroundColor,
      //   shadowColor: Colors.grey,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios_rounded,
      //       color: AppColors.primaryColor,
      //       size: 20,
      //     ),
      //   ),
      //   title: Text(
      //     "GIỎ HÀNG",
      //     style: StylesOfWidgets.textStyle1(
      //         fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: FutureBuilder<bool>(
          future: cartViewModel.checkUserLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.data == true) {
              // Người dùng đã đăng nhập
              return Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20.sp, left: 20.sp, bottom: 20.sp),
                      child: Text(
                        "Các món đã chọn",
                        softWrap: true,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2,
                            fw: FontWeight.w400,
                            clr: AppColors.gray),
                      ),
                    ),
                  ]),
                  FutureBuilder(
                    future: cartViewModel.getCartByUserId(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        if (snapshot.data == null) {
                          return const Center(
                            child: Text("Chưa có sản phẩm trong giỏ hàng"),
                          );
                        }
                        final cartDetails = snapshot.data!.cartDetails;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cartDetails.length,
                          itemBuilder: (context, index) {
                            var item = cartDetails[index];
                            return Padding(
                                padding: EdgeInsets.only(
                                    bottom: 20.sp, left: 20.sp, right: 20.sp),
                                child: Slidable(
                                    endActionPane: ActionPane(
                                        motion: const StretchMotion(),
                                        children: [
                                          SlidableAction(
                                              backgroundColor: Colors.red,
                                              label: "Xóa",
                                              onPressed: (context) {
                                                // items.removeAt(index);
                                                int cartId =
                                                    snapshot.data!.cartId;
                                                int productId = item.productId;
                                                cartViewModel
                                                    .removeFromCart(
                                                        productId, cartId)
                                                    .then(
                                                  (value) {
                                                    var snackBar = SnackBar(
                                                      content: Text(
                                                        value,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      backgroundColor:
                                                          Colors.red,
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  },
                                                );
                                              })
                                        ]),
                                    child: Itemincart(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Detailproductscreen(),
                                              settings: RouteSettings(
                                                  arguments: item.productId),
                                            ),
                                          );
                                        },
                                        image: item.productImageurl,
                                        name: item.productName,
                                        note: item.description,
                                        price: item.price,
                                        quantity: item.quantity,
                                        shopName: item.shopName)));
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.paymentScreen);
                      },
                      child: Row(
                        children: [
                          Text(
                            "Tiếp tục thanh toán",
                            softWrap: true,
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH2,
                                fw: FontWeight.w600,
                                clr: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    )
                  ]),
                ],
              );
            } else {
              // Người dùng chưa đăng nhập
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context)
                    .size
                    .height, // Chiều cao toàn màn hình
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.sp,
                          horizontal: 15.sp,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.loginScreen);
                      },
                      child: Text(
                        'ĐĂNG NHẬP',
                        style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          clr: AppColors.primaryColor,
                          fw: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(), // Đẩy nội dung còn lại lên
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
