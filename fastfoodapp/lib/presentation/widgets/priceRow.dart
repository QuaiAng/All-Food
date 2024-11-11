import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Pricerow extends StatelessWidget {
  const Pricerow(
      {super.key,
      required this.label,
      required this.amount,
      required this.isTotal});
  final String label;
  final double amount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontWeight: isTotal ? FontWeight.w400 : FontWeight.normal,
                    fontSize: SizeOfWidget.sizeOfH3),
              )),
          Text(Formatmoney.formatCurrency(amount),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: isTotal ? AppColors.primaryColor : Colors.black,
                    fontSize: SizeOfWidget.sizeOfH3),
              )),
        ],
      ),
    );
  }
}
