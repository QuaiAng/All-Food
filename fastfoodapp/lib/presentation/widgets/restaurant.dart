import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'dart:core';

class Restaurant extends StatelessWidget {
  const Restaurant(
      {super.key,
      required this.name_restaurant,
      required this.images,
      required this.price,
      required this.category_food,
      required this.rating,
      required this.comment,
      required this.time,
      required this.delivery});

  final String name_restaurant;
  final List<String> images;
  final String price;
  final String category_food;
  final String rating;
  final String comment;
  final String time;
  final String delivery;

  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          // navigation sang màn hình chi tiết món ăn
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context)
                          .size
                          .width, // Điều chỉnh chiều cao của carousel
                      child: PageView.builder(
                        itemCount: images.length,
                        scrollDirection: Axis.horizontal, // Vuốt ngang
                        itemBuilder: (context, index) {
                          return Image.asset(
                            images[index],
                            fit: BoxFit.fill, // Điều chỉnh cách hiển thị ảnh
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(name_restaurant,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                                decorationColor: Colors.white))),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(price,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decorationColor: Colors.white))),
                        ),
                        const Point(),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text(category_food,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decorationColor: Colors.white))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(rating,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decorationColor: Colors.white))),
                        const SizedBox(width: 12),
                        const Icon(Icons.star, color: AppColors.primaryColor),
                        const SizedBox(width: 12),
                        Text(comment,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decorationColor: Colors.white))),
                        const SizedBox(width: 12),
                        const Point(),
                        const SizedBox(width: 12),
                        const Icon(Icons.punch_clock_rounded,
                            color: Colors.grey),
                        Text(time,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decorationColor: Colors.white))),
                        const SizedBox(width: 12),
                        const Point(),
                        const SizedBox(width: 12),
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 10,
                          child: Icon(Icons.attach_money,
                              color: Colors.white, size: 18),
                        ),
                        const SizedBox(width: 6),
                        Text(delivery,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decorationColor: Colors.white))),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Point extends StatelessWidget {
  const Point({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.sp,
      height: 8.sp,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}
