import 'package:fastfoodapp/presentation/states/feedbackviewmodel.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Feedbackscreen extends StatelessWidget {
  const Feedbackscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var feedbackviewmodel =
        Provider.of<Feedbackviewmodel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ĐÁNH GIÁ",
          style: StylesOfWidgets.textStyle1(
              fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SẢN PHẨM",
                style: StylesOfWidgets.textStyle1(
                    fs: SizeOfWidget.sizeOfH2,
                    fw: FontWeight.w600,
                    clr: AppColors.gray),
              ),
              SizedBox(height: 15.sp),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tên",
                        style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH2,
                          fw: FontWeight.w500,
                          clr: const Color.fromRGBO(177, 174, 174, 1),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      Text(
                        "Từ",
                        style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH2,
                          fw: FontWeight.w500,
                          clr: const Color.fromRGBO(177, 174, 174, 1),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      Text(
                        "Giá",
                        style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH2,
                          fw: FontWeight.w500,
                          clr: const Color.fromRGBO(177, 174, 174, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 25.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feedbackviewmodel.foodName,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2,
                            fw: FontWeight.w500,
                            clr: Colors.black),
                      ),
                      SizedBox(height: 15.sp),
                      Text(
                        feedbackviewmodel.shopName,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2,
                            fw: FontWeight.w500,
                            clr: Colors.black),
                      ),
                      SizedBox(height: 15.sp),
                      Text(
                        Formatmoney.formatCurrency(56000),
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2,
                            fw: FontWeight.w500,
                            clr: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Text(
                "ĐÁNH GIÁ",
                style: StylesOfWidgets.textStyle1(
                    fs: SizeOfWidget.sizeOfH2,
                    fw: FontWeight.w600,
                    clr: AppColors.gray),
              ),
              SizedBox(height: 10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      feedbackviewmodel.updateSelectedStar(index + 1);
                    },
                    icon: Icon(
                      index < feedbackviewmodel.selectedStars
                          ? Icons.star_rate_rounded
                          : Icons.star_border_purple500_rounded,
                      color: index < feedbackviewmodel.selectedStars
                          ? AppColors.primaryColor
                          : AppColors.gray,
                      size: 28.sp,
                    ),
                  );
                }),
              ),
              SizedBox(height: 15.sp),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nhập đánh giá của bạn...',
                  hintStyle: StylesOfWidgets.textStyle1(
                    fs: SizeOfWidget.sizeOfH4,
                    fw: FontWeight.w400,
                    clr: AppColors.gray,
                  ),
                  border: const OutlineInputBorder(),
                ),
                maxLines: 4,
                controller: feedbackviewmodel.feedbackController,
              ),
              SizedBox(height: 15.sp),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Đặt nút về phía tay phải
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý gửi đánh giá

                      // print('Số sao đã chọn: ${feedbackviewmodel.selectedStars}');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text('GỬI',
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3,
                            fw: FontWeight.w500,
                            clr: AppColors.backgroundColor)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
