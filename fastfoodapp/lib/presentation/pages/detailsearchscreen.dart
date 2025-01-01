import 'package:fastfoodapp/presentation/states/detailsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/searchedrecent.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Detailsearchscreen extends StatelessWidget {
  const Detailsearchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var detailSearchViewModel =
        Provider.of<Detailsearchviewmodel>(context, listen: true); //instance

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(detailSearchViewModel.focusNode);
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
                  controller: detailSearchViewModel.searchTextcontroller,
                  focusNode: detailSearchViewModel.focusNode,
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
                  onPressed: () {
                    detailSearchViewModel.addSearchItem(
                        detailSearchViewModel.searchTextcontroller.text);
                  },
                  child: Text("Tìm kiếm",
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w400,
                          clr: AppColors.primaryColor)))
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
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
                        detailSearchViewModel.removeAllSearchItem();
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
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: detailSearchViewModel.recentSearch.length,
                  itemBuilder: (context, index) {
                    return Searchedrecent(
                      name: detailSearchViewModel.recentSearch[index],
                      onTap: () {
                        detailSearchViewModel.searchTextcontroller.text =
                            detailSearchViewModel.recentSearch[index];
                      },
                      onDeleteTap: () {
                        detailSearchViewModel.removeSearchItem(index);

                        print("Xóa $index");
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
