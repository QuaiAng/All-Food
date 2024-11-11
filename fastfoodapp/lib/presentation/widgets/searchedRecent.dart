import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Searchedrecent extends StatelessWidget {
  const Searchedrecent(
      {super.key,
      required this.name,
      required this.onTap,
      required this.onDeleteTap});
  final String name;
  final VoidCallback onTap;
  final VoidCallback onDeleteTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            const Icon(
              Icons.search_outlined,
              color: AppColors.gray,
              size: 20,
            ),
            const SizedBox(width: 16), // Khoảng cách giữa icon và text
            Expanded(
              child: Text(
                name,
                style: StylesOfWidgets.textStyle1(
                    fw: FontWeight.w400, fs: SizeOfWidget.sizeOfH3),
              ),
            ),
            const SizedBox(width: 16), // Khoảng cách thêm trước icon close
            IconButton(
              onPressed: onDeleteTap,
              icon: Icon(
                Icons.close,
                color: AppColors.gray,
                size: 17.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
