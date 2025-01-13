import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fastfoodapp/presentation/states/resultsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/iteminresultsearch.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Resultsearchscreen extends StatelessWidget {
  const Resultsearchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resultSearchViewModel =
        Provider.of<Resultsearchviewmodel>(context, listen: false);
    final args = ModalRoute.of(context)?.settings.arguments
        as String; // Nhận tham số truyền quá

    resultSearchViewModel.keywordTextcontroller.text = args;
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
                  controller: resultSearchViewModel.keywordTextcontroller,
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
                  onTap: () => Navigator.pop(context,
                      resultSearchViewModel.keywordTextcontroller.text),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.sp),
                Text(
                  "SẮP XẾP THEO",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3,
                      fw: FontWeight.w500,
                      clr: AppColors.gray),
                ),
                SizedBox(height: 15.sp),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            resultSearchViewModel.isRelevantSelected
                                ? AppColors.primaryColor // Màu khi được nhấn
                                : const Color.fromRGBO(
                                    241, 241, 241, 1), // Màu khi chưa nhấn
                        foregroundColor:
                            resultSearchViewModel.isRelevantSelected
                                ? Colors.white // Màu chữ khi nhấn
                                : Colors.black, // Màu chữ khi chưa nhấn
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Bo góc của nút
                        ),
                        minimumSize: const Size(
                            100, 40), // Kích thước tối thiểu (rộng, cao)
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8), // Padding
                      ),
                      onPressed: () {
                        //resultSearchViewModel.toggleRelevant();
                      },
                      child: Text(
                        "LIÊN QUAN",
                        style: StylesOfWidgets.textStyle1(
                            fs: 15.sp, fw: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    // Dropdown MỚI NHẤT
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        value: resultSearchViewModel.selectedNewest,
                        items: ['GẦN ĐÂY', 'XA HƠN']
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: StylesOfWidgets.textStyle1(
                                        fs: 15.sp, fw: FontWeight.w600),
                                  ),
                                ))
                            .toList(),
                        onChanged: (String? newValue) {
                          // if (newValue != null) {
                          //   context
                          //       .read<Resultsearchviewmodel>()
                          //       .updateNewest(newValue);
                          // }
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 26.sp,
                          width: 43.sp,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromRGBO(241, 241, 241, 1),
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(Icons.arrow_drop_down,
                              color: AppColors.gray),
                        ),
                      ),
                    ),

                    SizedBox(width: 10.sp),
                    // Dropdown MỚI NHẤT
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        value: resultSearchViewModel.selectedPrice != "GIÁ"
                            ? resultSearchViewModel.selectedPrice
                            : null, // Hiển thị null nếu giá trị mặc định là "GIÁ"
                        // value: Provider.of<Resultsearchviewmodel>(context,
                        //         listen: false)
                        //     .selectedPrice,
                        items: ['35k - 100k', '100k - 200k', '>200k']
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: StylesOfWidgets.textStyle1(
                                      fs: 15.sp,
                                      fw: FontWeight.w600,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            context
                                .read<Resultsearchviewmodel>()
                                .updatePrice(newValue);
                          }
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 26.sp,
                          width: 46.sp,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(
                                  241, 241, 241, 1) // Màu mặc định

                              ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(Icons.arrow_drop_down,
                              color: AppColors.gray // Màu biểu tượng mặc định
                              ),
                        ),
                        hint: Text(
                          "GIÁ",
                          style: StylesOfWidgets.textStyle1(
                            fs: 15.sp,
                            fw: FontWeight.w600,
                            clr: Colors.black, // Màu hiển thị khi chưa chọn
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
                Text(
                  "KẾT QUẢ TÌM KIẾM",
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3,
                      fw: FontWeight.w500,
                      clr: AppColors.gray),
                ),
                SizedBox(height: 15.sp),
                FutureBuilder(
                  future: resultSearchViewModel.SearchProductByName(args),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final filteredProducts =
                          resultSearchViewModel.filteredProducts;
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Số cột hiển thị
                          childAspectRatio: 0.7, // Tỷ lệ khung hình mỗi item
                          mainAxisSpacing: 4, // Khoảng cách giữa các hàng
                          crossAxisSpacing: 10, // Khoảng cách giữa các cột
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ItemInResultSearchScreen(
                                foodName: filteredProducts[index].productName,
                                price: "${filteredProducts[index].price}đ",
                                address: filteredProducts[index].shopAddress,
                                image: 'assets/images/bg.png',
                                shopName: filteredProducts[index].shopName,
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const TestDetailproductscreen(),
                                  //     settings: RouteSettings(
                                  //         arguments: filteredProducts[index]
                                  //             .productId),
                                  //   ),
                                  // );
                                },
                              ));
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
