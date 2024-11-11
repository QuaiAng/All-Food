import 'package:fastfoodapp/presentation/widgets/productfilter.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/res/colors.dart';

class Detailistproduct extends StatelessWidget {
  const Detailistproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        shadowColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
        title: Text(
          "Bán chạy nhất",
          style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH1),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Số cột hiển thị
          childAspectRatio: 0.6, // Tỷ lệ khung hình mỗi item
          mainAxisSpacing: 4, // Khoảng cách giữa các hàng
          crossAxisSpacing: 10, // Khoảng cách giữa các cột
        ),
        itemCount: 11,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Productfilter(
              shopName: "McDonald's",
              address: "HoChiMinh - VietNam",
              fee: "Free",
              time: "30m",
              rating: "4.1",
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
