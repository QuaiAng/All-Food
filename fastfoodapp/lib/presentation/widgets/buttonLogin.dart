import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Buttonlogin extends StatelessWidget {
  const Buttonlogin({super.key, required this.onClick, required this.text});
  final VoidCallback onClick;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: onClick,
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Text(
              text,
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: SizeOfWidget.sizeOfButtonLoginText,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          )),
    );
  }
}
