import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Address extends StatelessWidget {
  const Address({
    super.key,
    required this.name_address,
    required this.address,
  });
  final String name_address;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "${name_address} ",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH2,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
                ),
                subtitle: Text(
                  address,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: SizeOfWidget.sizeOfButtonLoginText,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                  ),
                ),
                leading: Icon(Icons.location_on,
                    color: AppColors.gray, size: SizeOfWidget.sizeOfText),
              ),
              Divider()
            ],
          )),
    );
  }
}
