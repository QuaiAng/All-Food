import 'package:fastfoodapp/presentation/widgets/searchedRecent.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// List searched = List.generate(20, (index) {
//   return InkWell(
//     onTap: () {},
//     child: ListTile(
//       leading: const Icon(
//         Icons.search_outlined,
//         color: AppColors.gray,
//         size: 20,
//       ),
//       title: Text(
//         "Bánh mì",
//         style: StylesOfWidgets.textStyle1(
//             fw: FontWeight.w400, fs: SizeOfWidget.sizeOfH3),
//       ),
//       trailing: IconButton(
//         onPressed: (){}, 
//         icon: Icon(Icons.close,
//         color: AppColors.gray,
//         size: 20
//         )
//       ),
//     ),
//   );
// });

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

class Detailsearchscreen extends StatefulWidget {
  const Detailsearchscreen({super.key});

  @override
  State<StatefulWidget> createState() => Detailsearchscreen_State();
}

class Detailsearchscreen_State extends State<Detailsearchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      // prefixIcon: IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.search_outlined,
                      //       //color: AppColors.primaryColor,
                      //     )),
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
                    child: Text("Cancel",
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3,
                            fw: FontWeight.w400,
                            clr: AppColors.primaryColor
                        )))
              ],
            ),
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
                    onPressed: () {},
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Searchedrecent(name: searched[index], index: index,);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
