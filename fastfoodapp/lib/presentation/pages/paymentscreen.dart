import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/presentation/widgets/itemRow.dart';
import 'package:fastfoodapp/presentation/widgets/priceRow.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

List items = List.generate(12, (index) {
  return const Itemrow(
    quantity: 3,
    name: "Gà cay",
    description: "Lớp da gà giòn, cay Lớp da gà giòn, cay Lớp da gà giòn, cay",
    price: 320000.0,
  );
});

class Paymentscreen extends StatelessWidget {
  const Paymentscreen({super.key});
  final double total = 400000.0;
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
          "Thanh Toán",
          style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH1),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index < items.length) {
                final item = items[index];

                return Column(
                  children: [
                    item,
                    Container(
                      height: 5.sp,
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: const Divider(
                        thickness: 0.5,
                      ),
                    )
                  ],
                );
              } else if (index == items.length) {
                return Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    children: [
                      const Pricerow(
                          label: "Phụ phí", amount: 0, isTotal: false),
                      const Pricerow(
                          label: "Phí giao hàng", amount: 0, isTotal: false),
                      const Pricerow(
                          label: "Tổng thanh toán",
                          amount: 96000,
                          isTotal: true),
                      const Divider(thickness: 0.5),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.voucherScreen);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Voucher",
                                  style: StylesOfWidgets.textStyle1(
                                      fs: SizeOfWidget.sizeOfH3)),
                              Icon(Icons.arrow_forward_ios, size: 17.sp),
                            ],
                          ),
                        ),
                      ),
                      const Divider(thickness: 0.5),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Thêm món khác",
                                  style: StylesOfWidgets.textStyle1(
                                      fs: SizeOfWidget.sizeOfH3,
                                      clr: AppColors.primaryColor)),
                              Icon(Icons.arrow_forward_ios, size: 17.sp),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          )),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          height: 43.sp,
          color: AppColors.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tổng",
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(fontSize: 17.sp)),
                  ),
                  Text(
                    Formatmoney.formatCurrency(total),
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeOfWidget.sizeOfH3)),
                  )
                ],
              ),
              Buttonlogin(onClick: () {}, text: "THANH TOÁN")
            ],
          )),
    );
  }
}
