import 'package:fastfoodapp/presentation/pages/resultsearchscreen.dart';
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
    final detailSearchViewModel =
        Provider.of<Detailsearchviewmodel>(context, listen: true);

    // Focus vào TextField khi màn hình được mở
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
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                final keyword =
                    detailSearchViewModel.searchTextcontroller.text.trim();
                if (keyword.isNotEmpty) {
                  detailSearchViewModel.addSearchItem(keyword);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Resultsearchscreen(),
                      settings: RouteSettings(arguments: keyword),
                    ),
                  ).then((result) {
                    if (result == null || result.isEmpty) {
                      detailSearchViewModel.searchTextcontroller
                          .clear(); // Clear nếu không có kết quả
                    } else {
                      detailSearchViewModel.searchTextcontroller.text = result;
                    }
                  });
                }
              },
              child: Text(
                "Tìm kiếm",
                style: StylesOfWidgets.textStyle1(
                  fs: SizeOfWidget.sizeOfH3,
                  fw: FontWeight.w400,
                  clr: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
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
                      clr: AppColors.gray,
                    ),
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
                        clr: AppColors.gray,
                      ),
                    ),
                  ),
                ],
              ),
              detailSearchViewModel.recentSearch.isEmpty
                  ? Center(
                      child: Text(
                        "Không có tìm kiếm gần đây",
                        style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w300,
                          clr: AppColors.gray,
                        ),
                      ),
                    )
                  : ListView.builder(
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
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
