import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/widgets/topfooditem.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Text("Search",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfLargeHeader, fw: FontWeight.w600)),
              SizedBox(
                height: 20.sp,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.detailsearchScreen);
                },
                child: Container(
                  height: 30.sp,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 240, 240),
                    border: Border.all(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.sp, right: 20.sp),
                        child: Icon(
                          Icons.search,
                          size: 20.sp,
                          color: AppColors.placeholderColor,
                        ),
                      ),
                      Text(
                        "Tìm kiếm",
                        style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          clr: AppColors.placeholderColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.sp,
              ),
              Text("Các quán nổi bật",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w500)),
              GridView.builder(
                shrinkWrap: true,
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
                      child: Topfooditem(
                        foodName: "Bánh Mì",
                        price: "20K",
                        address: "Quận 7",
                        image: 'assets/images/bg.png',
                        onTap: () {},
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
