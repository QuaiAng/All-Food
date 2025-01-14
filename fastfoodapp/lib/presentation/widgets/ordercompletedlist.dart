import 'dart:ui';

import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderCompletedList extends StatelessWidget {
  final bool isPending;

  const OrderCompletedList({Key? key, required this.isPending})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: 5, // Số lượng đơn hàng
      itemBuilder: (context, index) {
        return Card(
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
                            // Tên món ăn
                            Text(
                              "Tên món ăn",
                              style: StylesOfWidgets.textStyle1(
                                  clr: Colors.black,
                                  fs: SizeOfWidget.sizeOfH2,
                                  fw: FontWeight.w400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
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
                                    "Tên shop",
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
                              "Ngày ... tháng ... năm ...",
                              style: StylesOfWidgets.textStyle1(
                                clr: AppColors.gray,
                                fs: SizeOfWidget.sizeOfH3,
                              ),
                            ),
                            SizedBox(height: 15.sp),
                            // Số lượng
                            Text(
                              "Số lượng: ...",
                              style: StylesOfWidgets.textStyle1(
                                clr: AppColors.gray,
                                fs: SizeOfWidget.sizeOfH3,
                              ),
                            ),
                            SizedBox(height: 20.sp),
                          ],
                        ),
                        // Giá tiền (cố định ở đáy)
                        Padding(
                          padding: EdgeInsets.only(top: 20.sp),
                          child: Text(
                            '00000 đ',
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
        );
      },
    );
  }
}
