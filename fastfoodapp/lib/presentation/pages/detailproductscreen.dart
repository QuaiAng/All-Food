import 'package:fastfoodapp/presentation/states/detailproductscreenviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/presentation/widgets/feedback.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Detailproductscreen extends StatelessWidget {
  Detailproductscreen(
      {required this.image,
      required this.nameFood,
      required this.categoryFoodName,
      required this.comment,
      required this.rating,
      required this.imageShop,
      required this.nameShop,
      required this.ratingShop,
      required this.quantity});

  late String image;
  late String categoryFoodName;
  late String nameFood;
  late String comment;
  late double rating;
  late int quantity;
  late String imageShop;
  late String nameShop;
  late double ratingShop;

  final List<String> images = [
    "assets/images/anhchandung.jpg",
    "assets/images/anhchandung.png",
    "assets/images/anhchandung.jpg",
    "assets/images/anhchandung2.jpg",
    "assets/images/anhchandung.jpg",
    "assets/images/anhchandung2.jpg",
    "assets/images/anhchandung2.jpg",
    "assets/images/anhchandung2.jpg",
    "assets/images/anhchandung2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final detailproductscreenViewModel =
        Provider.of<Detailproductscreenviewmodel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  // hình nền
                  height: 60.sp,
                  width: double.infinity,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 18.sp,
                  left: 18.sp,
                  // icon quay trở lại
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios,
                          size: 21.sp, color: AppColors.gray)),
                )
              ],
            ),
            Container(
              color: AppColors.backgroundColor,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameFood,
                    style: StylesOfWidgets.textStyle1(
                        fs: 20.sp, fw: FontWeight.bold, clr: Colors.black),
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  SizedBox(
                    width: 159.sp,
                    child: Text(
                      comment,
                      softWrap: true,
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w300,
                          clr: AppColors.gray),
                    ),
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Text(
                    categoryFoodName,
                    style: StylesOfWidgets.textStyle1(
                        fs: 16.sp,
                        fw: FontWeight.w400,
                        clr: AppColors.placeholderColor),
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "$rating",
                        style: StylesOfWidgets.textStyle1(
                            fs: 14.sp,
                            fw: FontWeight.normal,
                            clr: AppColors.gray),
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: AppColors.primaryColor,
                        size: 17.sp,
                      ),
                      Text(
                        "| $quantity lượt bán",
                        style: StylesOfWidgets.textStyle1(
                            fs: 14.sp,
                            fw: FontWeight.normal,
                            clr: AppColors.gray),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Divider(
                    height: 0.5.sp,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                              radius: 20.sp,
                              backgroundImage: AssetImage(imageShop)),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nameShop,
                                style: StylesOfWidgets.textStyle1(
                                    fs: SizeOfWidget.sizeOfH2,
                                    fw: FontWeight.w500,
                                    clr: Colors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$ratingShop",
                                    style: StylesOfWidgets.textStyle1(
                                        fs: 15.sp,
                                        fw: FontWeight.normal,
                                        clr: AppColors.gray),
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: AppColors.primaryColor,
                                    size: 18.sp,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Stack(
                            // phần nút nhấn tin nhắn
                            alignment: Alignment.center,
                            children: [
                              // Vòng tròn nền lớn màu hồng nhạt
                              Container(
                                width: 28.sp,
                                height: 28.sp,
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.05),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Bong bóng màu vàng có biểu tượng dấu ba chấm
                              Container(
                                width: 22.sp,
                                height: 22.sp,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(
                                  Icons.mark_unread_chat_alt_rounded,
                                  color: Colors.white,
                                  size: 17.sp,
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            // phần nút nhấn gọi
                            alignment: Alignment.center,
                            children: [
                              // Vòng tròn nền lớn màu hồng nhạt
                              Container(
                                width: 28.sp,
                                height: 28.sp,
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.05),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Bong bóng màu vàng có biểu tượng dấu ba chấm
                              Container(
                                width: 22.sp,
                                height: 22.sp,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 17.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  Divider(
                    height: 0.5.sp,
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Text(
                    "ĐÁNH GIÁ CỦA KHÁCH HÀNG",
                    style: StylesOfWidgets.textStyle1(
                        fs: SizeOfWidget.sizeOfH2,
                        fw: FontWeight.w500,
                        clr: AppColors.gray),
                  ),
                  SizedBox(
                    width: 100.sp,
                    height: 96.sp,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Comment(
                                image: images[index + 2],
                                nameUser: "Tran Thi Ngoc Can",
                                feedback:
                                    "Shortbread, chocolate turtle cookies, and red velvet, Shortbread, chocolate turtle cookies, and red velvet"),
                          ]);
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          height: 50.sp,
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 29.sp,
                      height: 29.sp,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // nút nhấn tăng, tăng sản phẩm đã chọn
                          detailproductscreenViewModel.btnHigh();
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Text(
                      detailproductscreenViewModel.quantity.toString(),
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 22.sp)),
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Container(
                      width: 29.sp,
                      height: 29.sp,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            // nút dấu trừ , giảm sản phẩm
                            detailproductscreenViewModel.btnLow();
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Buttonlogin(
                    onClick: () {
                      // nút nhấn xử lí
                    },
                    text: "THÊM VÀO GIỎ HÀNG"),
              ],
            ),
          )),
    );
  }
}
