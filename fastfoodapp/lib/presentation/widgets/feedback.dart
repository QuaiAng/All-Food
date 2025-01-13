import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Comment extends StatelessWidget {
  Comment(
      {super.key, required this.image, required this.nameUser, required this.feedback});

  late String image;
  late String nameUser;
  late String feedback;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16.sp,
              backgroundImage: NetworkImage(
                image,
              ),
            ),
            SizedBox(
              width: 5.sp,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    nameUser,
                    style: StylesOfWidgets.textStyle1(
                        fs: SizeOfWidget.sizeOfH3,
                        fw: FontWeight.w400,
                        clr: Colors.black),
                  ),
                  Row(
                      children: List.generate(5, (index) {
                    return Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    );
                  })),
                  SizedBox(
                    height: 8.sp,
                  ),
                  SizedBox(
                    width: 70.sp,
                    child: Text(
                      feedback,
                      softWrap: true,
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH4,
                          fw: FontWeight.w400,
                          clr: AppColors.gray),
                    ),
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
