import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/paymentviewmodel.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/widgets/buttonlogin.dart';
import 'package:fastfoodapp/presentation/widgets/otherprice.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Paymentscreen extends StatelessWidget {
  const Paymentscreen({super.key});
  final double total = 400000.0;

  Future _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      barrierColor: Colors.black87.withOpacity(0.3),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber.withOpacity(0.1),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 35.sp,
                  width: 35.sp,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Text(
                  "THÀNH CÔNG",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w400),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Text(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    "Bạn đã đặt hàng thành công. Các bạn sẽ nhận được thức ăn trong vòng 25 phút. Cảm ơn đã sử dụng dịch vụ của chúng tôi. Thưởng thức đồ ăn của bạn ^^",
                    style: StylesOfWidgets.textStyle1(
                        fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Chỉnh sửa thông tin cá nhân');
                  },
                  child: Text(
                    'Quay lại',
                    style: StylesOfWidgets.textStyle1(
                        clr: AppColors.primaryColor, fs: SizeOfWidget.sizeOfH2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentViewModel = Provider.of<Paymentviewmodel>(context);
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
            size: 20,
          ),
        ),
        title: Text(
          "THANH TOÁN",
          style: StylesOfWidgets.textStyle1(
              fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paymentViewModel.listProduct.length,
              itemBuilder: (context, index) {
                final item = paymentViewModel.listProduct[index];

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
              },
            ),
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  const Pricerow(label: "Phụ phí", amount: 0, isTotal: false),
                  const Pricerow(
                      label: "Phí giao hàng", amount: 0, isTotal: false),
                  const Pricerow(label: "Voucher", amount: -0, isTotal: false),
                  const Pricerow(
                      label: "Tổng thanh toán", amount: 96000, isTotal: true),
                  const Divider(thickness: 0.5),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.paymentmethodScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phương thức thanh toán",
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH3)),
                          Icon(Icons.arrow_forward_ios, size: 17.sp),
                        ],
                      ),
                    ),
                  ),
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
                    onTap: () {
                      Provider.of<AppProvier>(context, listen: false)
                          .setCurrentIndexPage(0);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.mainScreen,
                        (route) => false, // Xóa tất cả các route trước đó
                      );
                    },
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
            )
          ],
        ),
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
              Buttonlogin(
                  onClick: () {
                    _showBottomSheet(context);
                  },
                  text: "THANH TOÁN")
            ],
          )),
    );
  }
}
