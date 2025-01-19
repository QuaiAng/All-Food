import 'dart:ui';

import 'package:fastfoodapp/presentation/states/orderstatusviewmodel.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OrderCompletedList extends StatelessWidget {
  final bool role;
  const OrderCompletedList({Key? key, required this.role}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<OrderStatusViewModel>(context);

    if (!role) {
      //Phía shop
      return ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: 5, //snapshot.data!.length, // Số lượng đơn hàng
        itemBuilder: (context, index) {
          //var orderModel = snapshot.data![index];
          // var orderDetail = snapshot.data![index].orderDetails[index];
          return InkWell(
            onTap: (){

            },
            child: Card(
              elevation: 0,
              color: AppColors.backgroundColor,
              margin: EdgeInsets.symmetric(vertical: 8.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ảnh món ăn
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Bo góc cho ảnh
                        child: Image.asset(
                          'assets/images/bg.png',
                          fit: BoxFit.cover,
                          width: 50.sp, // Đặt chiều rộng cụ thể
                          height: 60.sp, // Đặt chiều cao cụ thể
                        ),
                      ),
                      SizedBox(width: 12.sp), // Khoảng cách giữa ảnh và nội dung
                      // Nội dung thông tin đơn hàng
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Mã hóa đơn
                                Text(
                                  //orderModel.date,
                                  "Mã hóa đơn",
                                  style: StylesOfWidgets.textStyle1(
                                    clr: AppColors.gray,
                                    fs: SizeOfWidget.sizeOfH3,
                                  ),
                                ),
            
                                SizedBox(height: 15.sp),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 18.sp,
                                      color: AppColors.gray,
                                    ),
                                    SizedBox(width: 4.sp),
                                    Expanded(
                                      child: Text(
                                        //orderModel.shopName,
                                        "Địa chỉ giao",
                                        style: StylesOfWidgets.textStyle1(
                                          clr: AppColors.gray,
                                          fs: SizeOfWidget.sizeOfH3,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.sp),
                                // Ngày tháng đặt
                                Text(
                                  //orderModel.date,
                                  "Ngày đặt",
                                  style: StylesOfWidgets.textStyle1(
                                    clr: AppColors.gray,
                                    fs: SizeOfWidget.sizeOfH3,
                                  ),
                                ),
                                SizedBox(height: 15.sp),
                                // Số lượng
            
                                SizedBox(height: 20.sp),
                              ],
                            ),
                            // Giá tiền (cố định ở đáy)
                            Padding(
                              padding: EdgeInsets.only(top: 20.sp),
                              child: Text(
                                //Formatmoney.formatCurrency(orderModel.total * 1.0),
                                "Tổng tiền",
                                style: StylesOfWidgets.textStyle1(
                                  clr: AppColors.primaryColor,
                                  fs: SizeOfWidget.sizeOfH2,
                                  fw: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            
                // Nút "HỦY" (cố định góc dưới phải)
                Positioned(
                  bottom: 10.sp,
                  right: 10.sp,
                  child: TextButton(
                    onPressed: () {
                      // Xử lý khi nhấn nút HỦY
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.sp,
                        vertical: 10.sp,
                      ),
                      backgroundColor: Colors.red, // Không có màu nền
                      foregroundColor: Colors.white, // Màu chữ vàng
                      // side: const BorderSide(
                      //   // Viền vàng
                      //   color: AppColors.primaryColor,
                      //   width: 1.5,
                      // ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text("XÓA",
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2,
                            fw: FontWeight.w400,
                            clr: Colors.white)),
                  ),
                ),
              ]),
            ),
          );
        },
      );
    }
    //Phía người dùng
    return FutureBuilder(
        future: orderViewModel.getOrderByUserIdComplete(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: snapshot.data!.length, // Số lượng đơn hàng
              itemBuilder: (context, index) {
                var orderModel = snapshot.data![index];
                // var orderDetail = snapshot.data![index].orderDetails[index];
                return InkWell(
                  onTap: (){
                    
                  },
                  child: Card(
                    elevation: 0,
                    color: AppColors.backgroundColor,
                    margin: EdgeInsets.symmetric(vertical: 8.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.sp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Ảnh món ăn
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(10), // Bo góc cho ảnh
                              child: Image.asset(
                                'assets/images/bg.png',
                                fit: BoxFit.cover,
                                width: 50.sp, // Đặt chiều rộng cụ thể
                                height: 60.sp, // Đặt chiều cao cụ thể
                              ),
                            ),
                            SizedBox(
                                width: 12.sp), // Khoảng cách giữa ảnh và nội dung
                            // Nội dung thông tin đơn hàng
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Tên món ăn
                  
                                      SizedBox(height: 15.sp),
                                      // Tên cửa hàng
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.storefront_outlined,
                                            size: 18.sp,
                                            color: AppColors.gray,
                                          ),
                                          SizedBox(width: 4.sp),
                                          Expanded(
                                            child: Text(
                                              orderModel.shopName,
                                              style: StylesOfWidgets.textStyle1(
                                                clr: AppColors.gray,
                                                fs: SizeOfWidget.sizeOfH3,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15.sp),
                                      // Ngày tháng đặt
                                      Text(
                                        orderModel.date,
                                        style: StylesOfWidgets.textStyle1(
                                          clr: AppColors.gray,
                                          fs: SizeOfWidget.sizeOfH3,
                                        ),
                                      ),
                                      SizedBox(height: 15.sp),
                                      // Số lượng
                  
                                      SizedBox(height: 20.sp),
                                    ],
                                  ),
                                  // Giá tiền (cố định ở đáy)
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.sp),
                                    child: Text(
                                      Formatmoney.formatCurrency(
                                          orderModel.total * 1.0),
                                      style: StylesOfWidgets.textStyle1(
                                        clr: AppColors.primaryColor,
                                        fs: SizeOfWidget.sizeOfH2,
                                        fw: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  
                      // Nút "HỦY" (cố định góc dưới phải)
                      Positioned(
                        bottom: 10.sp,
                        right: 10.sp,
                        child: TextButton(
                          onPressed: () {
                            // Xử lý khi nhấn nút HỦY
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.sp,
                              vertical: 10.sp,
                            ),
                            backgroundColor: Colors.red, // Không có màu nền
                            foregroundColor: Colors.white, // Màu chữ vàng
                            // side: const BorderSide(
                            //   // Viền vàng
                            //   color: AppColors.primaryColor,
                            //   width: 1.5,
                            // ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text("XÓA",
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH2,
                                  fw: FontWeight.w400,
                                  clr: Colors.white)),
                        ),
                      ),
                    ]),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Không tìm thấy dữ liệu"));
          }
        });
  }
}
