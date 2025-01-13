import 'package:fastfoodapp/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class StylesOfWidgets {
  static PinTheme errorPinTheme = PinTheme(
    width: 30.sp,
    height: 30.sp,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.red, width: 1),
    ),
  );

  static PinTheme defaultPinTheme = PinTheme(
    width: 30.sp,
    height: 30.sp,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.primaryColor, width: 1),
    ),
  );

  static OutlineInputBorder textboxStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: AppColors.primaryColor,
      width: 0.8,
    ),
  );
  static OutlineInputBorder errorTextboxStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 0.8,
    ),
  );

  static TextStyle textStyle1(
          {double fs = 10,
          Color clr = Colors.black,
          FontWeight fw = FontWeight.normal}) =>
      GoogleFonts.inter(
          textStyle: TextStyle(
              decoration: TextDecoration.none, // Loại bỏ gạch dưới
              fontSize: fs,
              fontWeight: fw,
              color: clr));
}
