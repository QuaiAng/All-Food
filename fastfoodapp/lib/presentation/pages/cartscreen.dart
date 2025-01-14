import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/cartviewmodel.dart';
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
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 20.sp, left: 20.sp, bottom: 20.sp),
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
                                          cartViewModel.removeFromCart(index);
                                          const snackBar = SnackBar(
                                            content: Text(
                                              "Đã xóa",
                                              textAlign: TextAlign.center,
                                            ),
                                            backgroundColor: Colors.red,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        })
                                  ]),
                              child: Itemincart(
                                  onTap: () {},
                                  image: Imagepath.burger,
                                  name: item.productId.toString(),
                                  note: "OK",
                                  price: item.price,
                                  quantity: item.quantity,
                                  shopName: item.shopId.toString())));
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
        ),
      ),
    );
  }
}
