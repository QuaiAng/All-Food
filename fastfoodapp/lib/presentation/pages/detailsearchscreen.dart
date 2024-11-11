import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/widgets/searchedrecent.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

final List<String> searched = [
  "Bánh mì",
  "Phở bò",
  "Cơm tấm",
  "Hủ tiếu",
  "Bún chả",
  "Chả giò",
  "Gỏi cuốn",
  "Mì Quảng",
  "Bún bò Huế",
  "Cơm chiên Dương Châu",
  "Nem nướng",
  "Lẩu Thái",
  "Chè thập cẩm",
  "Trà sữa",
  "Nước ép trái cây",
  "Pizza",
  "Bánh bao",
  "Bánh xèo",
  "Súp cua",
  "Chả cá Lã Vọng",
];

class Detailsearchscreen extends StatelessWidget {
  const Detailsearchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvier>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(provider.focusNode);
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: AppColors.backgroundColor,
          shadowColor: Colors.grey,
          automaticallyImplyLeading: false,
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
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: provider.searchTextcontroller,
                  focusNode: provider.focusNode,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm",
                    hintStyle: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: AppColors.placeholderColor,
                            fontSize: SizeOfWidget.sizeOfH3,
                            fontWeight: FontWeight.w300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide
                          .none, // Viền trong suốt khi không được focus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide.none, // Viền trong suốt khi được focus
                    ),
                    fillColor: Colors.transparent,
                    filled: true, // Điều này đảm bảo màu nền là transparent
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text("Tìm kiếm",
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w400,
                          clr: AppColors.primaryColor)))
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tìm kiếm gần đây",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3,
                      fw: FontWeight.w300,
                      clr: AppColors.gray),
                ),
                TextButton(
                    onPressed: () {
                      searched.removeRange(0, searched.length);
                    },
                    child: Text(
                      "Xóa tất cả",
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH4,
                          fw: FontWeight.w400,
                          clr: AppColors.gray),
                    ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: searched.length,
                  itemBuilder: (context, index) {
                    return Searchedrecent(
                      name: searched[index],
                      onTap: () {
                        provider.searchTextcontroller.text = searched[index];
                      },
                      onDeleteTap: () {
                        searched.removeAt(index);
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
