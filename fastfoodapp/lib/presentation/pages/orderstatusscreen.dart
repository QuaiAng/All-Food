import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/widgets/timeline.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Orderstatusscreen extends StatefulWidget {
  const Orderstatusscreen({super.key});

  @override
  State<Orderstatusscreen> createState() => _OrderstatusscreenState();
}

class _OrderstatusscreenState extends State<Orderstatusscreen> {
  String h1 = "Thời gian dự kiến...";
  String h2 = "23m";
  String h3 =
      "Đơn hàng của bạn có thể được giao muộn hơn thời gian dự kiến do các yếu tố bên ngoài !";
  Color backColor = AppColors.primaryColor;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvier>(context);
    String h1 = provider.orderStatus != 5 ? "Thời gian dự kiến..." : "Đã giao";
    String h2 = provider.orderStatus != 5 ? "23m" : "--";
    String h3 = provider.orderStatus != 5
        ? "Đơn hàng của bạn có thể được giao muộn hơn thời gian dự kiến do các yếu tố bên ngoài !"
        : "Đơn hàng của bạn đã được giao";
    Color backColor =
        provider.orderStatus != 5 ? AppColors.primaryColor : Colors.green;
    return Scaffold(
        backgroundColor: Colors.white,
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
            "THEO DÕI ĐƠN HÀNG",
            style: StylesOfWidgets.textStyle1(
                fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: backColor, borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 20.sp),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          h1,
                          style: StylesOfWidgets.textStyle1(
                              fs: 20.sp,
                              clr: Colors.black54,
                              fw: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: Colors.yellow,
                              size: 23.sp,
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            Text(
                              h2,
                              style: StylesOfWidgets.textStyle1(
                                  fs: 20.sp, fw: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          softWrap: true,
                          textAlign: TextAlign.center,
                          h3,
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH3),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                const Timeline(),
                // SizedBox(
                //   height: 20.sp,
                // ),
                Text(
                  "Đơn hàng của bạn đã đặt từ shop ABC",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH2,
                      clr: AppColors.gray,
                      fw: FontWeight.w500),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "Lẩu Thái",
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2),
                      ),
                      subtitle: Text(
                        "Nhiều bún, nhiều rau, nhiều hải sản, nhiều nước lèo, ít tiền !",
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3),
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.only(left: 20.sp),
                        child: Text(
                          Formatmoney.formatCurrency(128000.0),
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH3, fw: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
