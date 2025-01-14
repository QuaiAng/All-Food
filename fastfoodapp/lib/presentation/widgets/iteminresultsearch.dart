import 'dart:io';

import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemInResultSearchScreen extends StatelessWidget {
  const ItemInResultSearchScreen({
    super.key,
    required this.foodName,
    required this.price,
    required this.address,
    required this.image,
    required this.shopName,
    required this.onTap,
  });

  final String image;
  final String foodName;
  final String price;
  final String address;
  final String shopName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
        decoration: BoxDecoration(
          color: Colors.white, // Màu nền của container
          borderRadius: BorderRadius.circular(10), // Bo góc
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Màu và độ mờ của bóng
              blurRadius: 6, // Độ mờ của bóng
              offset: const Offset(0, 4), // Độ dịch chuyển bóng (x, y)
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 47.sp,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Bo góc cho ảnh
                  child: Image.file(
                    File(image),
                    fit: BoxFit.fill,
                    width: double.infinity,
                  )),
            ),
            SizedBox(height: 10.sp),
            // Nội dung thông tin
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              child: Expanded(
                ///flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tên món ăn
                    Text(
                      foodName,
                      style: StylesOfWidgets.textStyle1(
                          clr: Colors.black, fs: SizeOfWidget.sizeOfH1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.sp),
                    // Địa chỉ
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on,
                            size: 18.sp, color: AppColors.gray),
                        const SizedBox(width: 4.0),
                        Expanded(
                          child: Text(
                            address,
                            style: StylesOfWidgets.textStyle1(
                                clr: AppColors.gray, fs: SizeOfWidget.sizeOfH3),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    // Tên cửa hàng
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.storefront_outlined,
                            size: 18.sp, color: AppColors.gray),
                        const SizedBox(width: 4.0),
                        Expanded(
                          child: Text(
                            shopName,
                            style: StylesOfWidgets.textStyle1(
                                clr: AppColors.gray, fs: SizeOfWidget.sizeOfH3),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.sp),
                    // Giá tiền (vị trí góc dưới phải)
                    Text(
                      '$price đ',
                      style: StylesOfWidgets.textStyle1(
                          clr: AppColors.primaryColor,
                          fs: SizeOfWidget.sizeOfH1,
                          fw: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
