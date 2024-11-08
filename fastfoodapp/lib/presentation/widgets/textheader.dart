import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textheader extends StatelessWidget {
  const Textheader(
      {super.key,
      required this.h1,
      required this.h2,
      required this.h3,
      required this.onClick});
  final String h1;
  final String h2;
  final String h3;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          h1,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: SizeOfWidget.sizeOfLargeHeader,
                  fontWeight: FontWeight.w300)),
        ),
        Text(
          h2,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: AppColors.gray, fontSize: SizeOfWidget.sizeOfH3)),
        ),
        InkWell(
          onTap: onClick,
          child: Text(
            h3,
            textAlign: TextAlign.left,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: SizeOfWidget.sizeOfH3)),
          ),
        )
      ],
    );
  }
}
