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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DANH SÁCH ĐỊA CHỈ ",
          style: GoogleFonts.inter(
              textStyle: TextStyle(
            fontSize: SizeOfWidget.sizeOfH1,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            
          ),),
        ),
        leading: IconButton(
          onPressed: () {
            // xử lí chuyển trang
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeOfWidget.sizeOfH1),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: SizeOfWidget.sizeOfH1,
                        horizontal: SizeOfWidget.sizeOfLoginHeader),
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: AppColors.gray,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            SizeOfWidget.sizeOfHeightPoint),
                        borderSide: BorderSide(
                            color: AppColors.placeholderColor, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            SizeOfWidget.sizeOfHeightPoint),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor, width: 1.0)),
                    hintText: "Nhập địa chỉ",
                    hintStyle: TextStyle(color: AppColors.gray)),
              ),
              SizedBox(height: SizeOfWidget.sizeOfTextH1),
              Text(
                "ĐỊA CHỈ HIỆN TẠI",
                style: StylesOfWidgets.textStyle1(
                    clr: Colors.black,
                    fw: FontWeight.w500,
                    fs: SizeOfWidget.sizeOfLable),
              ),
              SizedBox(height: SizeOfWidget.sizeOfH3),
              Address(
                  name_address: "Địa chỉ hiện tại",
                  address:
                      "748 Huynh Tan Phat, Phu Nhuan, Quan 10, Thành Phố Hồ Chí Minh"),
              SizedBox(height: SizeOfWidget.sizeOfTextH1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ĐỊA CHỈ ĐÃ LƯU",
                    style: StylesOfWidgets.textStyle1(
                        clr: Colors.black,
                        fw: FontWeight.w500,
                        fs: SizeOfWidget.sizeOfLable),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "XÓA",
                        style: StylesOfWidgets.textStyle1(
                            clr: Colors.black,
                            fw: FontWeight.w300,
                            fs: SizeOfWidget.sizeOfButtonLoginText),
                      ))
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeOfWidget.sizeOfPaddingHorizontal),
                      child: Address(
                          name_address: "Địa chỉ ${index + 1}",
                          address:
                              "748 Huynh Tan Phat, Phu Nhuan, Quan 10, Thành Phố Hồ Chí Minh"),
                    );
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeOfWidget.sizeOfTextH1,
                vertical: SizeOfWidget.sizeOfPaddingHorizontal),
            child: Center(child: Buttonlogin(onClick: () {}, text: "LƯU")),
          )),
    );
  }
}
