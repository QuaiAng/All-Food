import 'package:fastfoodapp/presentation/widgets/voucherCard.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';

class Voucherscreen extends StatelessWidget {
  const Voucherscreen({super.key});

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
          "Voucher",
          style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH1),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 16, left: 30, right: 30),
              child: Vouchercard(
                  name: "Miễn phí giao hàng",
                  description:
                      "Miễn phí giao hàng cho đơn hàng có giá trị từ 100k",
                  turn: 3),
            );
          }),
    );
  }
}
