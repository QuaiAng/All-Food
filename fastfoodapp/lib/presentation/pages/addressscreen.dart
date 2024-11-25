import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/presentation/widgets/addresssection.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Addressscreen extends StatefulWidget {
  const Addressscreen({super.key});
  @override
  State<Addressscreen> createState() => _Addressscreen();
}

class _Addressscreen extends State<Addressscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: AppColors.primaryColor,
                    size: 20.sp,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DANH SÁCH ĐỊA CHỈ ",
                            style: StylesOfWidgets.textStyle1(
                                fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(height: SizeOfWidget.sizeOfH1),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: SizeOfWidget.sizeOfH1,
                        horizontal: SizeOfWidget.sizeOfLargeHeader),
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                    prefixIcon: const Icon(
                      Icons.location_on,
                      color: AppColors.gray,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: const BorderSide(
                            color: AppColors.placeholderColor, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: const BorderSide(
                            color: AppColors.primaryColor, width: 1.0)),
                    hintText: "Nhập địa chỉ",
                    hintStyle: const TextStyle(color: AppColors.gray)),
              ),
              SizedBox(height: 20.sp),
              Text(
                "ĐỊA CHỈ HIỆN TẠI",
                style: StylesOfWidgets.textStyle1(
                    clr: Colors.black,
                    fw: FontWeight.w500,
                    fs: SizeOfWidget.sizeOfH2),
              ),
              SizedBox(height: SizeOfWidget.sizeOfH3),
              const Address(
                  name_address: "Địa chỉ hiện tại",
                  address:
                      "748 Huynh Tan Phat, Phu Nhuan, Quan 10, Thành Phố Hồ Chí Minh"),
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ĐỊA CHỈ ĐÃ LƯU",
                    style: StylesOfWidgets.textStyle1(
                        clr: Colors.black,
                        fw: FontWeight.w500,
                        fs: SizeOfWidget.sizeOfH2),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "XÓA",
                        style: StylesOfWidgets.textStyle1(
                            clr: Colors.black,
                            fw: FontWeight.w300,
                            fs: SizeOfWidget.sizeOfH4),
                      ))
                ],
              ),
              Column(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.sp),
                    child: Address(
                        name_address: "Địa chỉ ${index + 1}",
                        address:
                            "748 Huynh Tan Phat, Phu Nhuan, Quan 10, Thành Phố Hồ Chí Minh"),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 4.sp),
            child: Center(child: Buttonlogin(onClick: () {}, text: "LƯU")),
          )),
    );
  }
}
