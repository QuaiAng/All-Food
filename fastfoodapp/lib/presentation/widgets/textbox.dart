import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Textbox extends StatefulWidget {
  const Textbox({
    super.key,
    required this.label,
    required this.obscureText,
    required this.validator,
    required this.controller,
  });
  final String label;
  final bool obscureText;
  final FormFieldValidator validator;
  final TextEditingController? controller;

  @override
  State<StatefulWidget> createState() {
    return TextboxState();
  }
}

class TextboxState extends State<Textbox> {
  late bool isPassword;

  @override
  void initState() {
    super.initState();
    isPassword = widget.obscureText;
  }

  void visibilityOnClick() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      maxLines: 1,
      controller: widget.controller,
      obscureText: isPassword,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 0.2.dp, left: 15.sp, right: 0.2.dp),
          suffixIcon: widget.obscureText
              ? ((isPassword
                  ? IconButton(
                      onPressed: visibilityOnClick,
                      icon: Icon(
                        size: 20.sp,
                        Icons.visibility_off_outlined,
                        color: AppColors.placeholderColor,
                      ))
                  : IconButton(
                      onPressed: visibilityOnClick,
                      icon: Icon(
                        size: 20.sp,
                        Icons.visibility_outlined,
                        color: AppColors.placeholderColor,
                      ))))
              : null,
          labelText: widget.label,
          labelStyle: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: AppColors.placeholderColor,
                  fontSize: SizeOfWidget.sizeOfH4)),
          enabledBorder: StylesOfWidgets.textboxStyle,
          focusedBorder: StylesOfWidgets.textboxStyle,
          errorBorder: StylesOfWidgets.errorTextboxStyle,
          focusedErrorBorder: StylesOfWidgets.errorTextboxStyle),
    );
  }
}
