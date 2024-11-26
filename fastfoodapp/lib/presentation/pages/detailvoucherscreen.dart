import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VoucherDetailScreen extends StatelessWidget {
  // const VoucherDetailScreen(
  //     {super.key,
  //     required this.startOfExpire,
  //     required this.endOfExpire,
  //     required this.offerDescription,
  //     required this.limitedProducts,
  //     required this.paymentMethod,
  //     required this.percent});
  // final DateTime startOfExpire;
  // final DateTime endOfExpire;
  // final String offerDescription;
  // final String limitedProducts;
  // final String paymentMethod;
  // final int percent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "CHI TIẾT VOUHCHER",
          style: StylesOfWidgets.textStyle1(
              fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 20.sp),
          child: Card(
            color: Colors.white,
            elevation: 10.sp,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hạn sử dụng voucher",
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH2,
                                fw: FontWeight.w700)),
                        SizedBox(height: 10.sp),
                        Text(
                          "02 Th11 2024 00:00 - 10 Th11 2024 23:59",
                          style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3,
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        Text("Ưu đãi",
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH2,
                                fw: FontWeight.w700)),
                        SizedBox(height: 10.sp),
                        Text(
                          "Giảm 30% phí giao hàng cho đơn hàng có giá trị từ 100k",
                          style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3,
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        Text("Sản phẩm áp dụng",
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH2,
                                fw: FontWeight.w700)),
                        SizedBox(height: 10.sp),
                        Text(
                          "Áp dụng trên App cho một số sản phẩm tham gia chương trình & cho một số người dùng nhất định. Không áp dụng cho sim, thẻ cào, e-voucher & sữa cho trẻ 0-24 tháng.",
                          style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3,
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        Text("Phương thức thanh toán",
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH2,
                                fw: FontWeight.w700)),
                        SizedBox(height: 10.sp),
                        Text("Tất cả các hình thức thanh toán.",
                            style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH3,
                            )),
                        SizedBox(
                          height: 8.sp,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.sp),
                    child: Text(
                      "30%",
                      textAlign: TextAlign.center,
                      style: StylesOfWidgets.textStyle1(
                        fs: 40.sp,
                        fw: FontWeight.w500,
                        clr: Colors.white,
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: AppColors.backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
          child: SizedBox(
            child: Center(
              child: Buttonlogin(onClick: () {}, text: "ÁP DỤNG VOUCHER"),
            ),
          ),
        ),
      ),
    );
  }
}
