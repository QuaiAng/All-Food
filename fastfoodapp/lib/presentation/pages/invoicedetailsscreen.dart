import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Invoicedetailsscreen extends StatelessWidget {
  final bool isAdmin;

  const Invoicedetailsscreen({Key? key, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHI TIẾT HÓA ĐƠN',
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 230, 228, 228),
            height: 30.sp,
            child: Row(
              children: [
                SizedBox(width: 12.sp),
                Text(
                  'THÔNG TIN ĐƠN HÀNG',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.sp),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Mã đơn hàng: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '123456',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Row(
                children: [
                  Text(
                    'Ngày đặt: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '12/12/2021',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Row(
                children: [
                  Text(
                    'Tên shop: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Fahasha',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Row(
                children: [
                  Text(
                    'Tổng tiền: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '100.000đ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.sp),
          Container(
            color: const Color.fromARGB(255, 230, 228, 228),
            height: 30.sp,
            child: Row(
              children: [
                SizedBox(width: 12.sp),
                Text(
                  'CHI TIẾT ĐƠN HÀNG',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.sp),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Tên món: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Bún riêu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Row(
                children: [
                  Text(
                    'Số lượng: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Row(
                children: [
                  Text(
                    'Giá: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '50.000đ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.sp),
          Container(
            color: const Color.fromARGB(255, 230, 228, 228),
            height: 30.sp,
            child: Row(
              children: [
                SizedBox(width: 12.sp),
                Text(
                  'CHI TIẾT ĐƠN HÀNG',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.sp),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Tên người nhận: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Bún riêu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Row(
                children: [
                  Text(
                    'Địa chỉ: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '165 Huỳnh thúc kháng',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.sp),
          Row(
            children: [
              SizedBox(width: 16.sp),
              if (isAdmin) ...[
                ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Hủy đơn hàng',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18.sp,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,  
                  side: BorderSide(color: AppColors.primaryColor),
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(width: 20.sp),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Duyệt đơn shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              ]
              else ... [
                ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Hủy đơn hàng',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18.sp,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,  
                  side: BorderSide(color: AppColors.primaryColor),
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(width: 20.sp),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Liên hệ shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              ]
            ],
          )
        ],
      )
    );
  }
}
