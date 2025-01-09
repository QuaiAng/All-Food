import 'package:flutter/material.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';

class Infofield extends StatelessWidget {
  const Infofield(
      {super.key,
      required this.label,
      required this.value,
      required this.isPassword,
      required this.isAddress,
      this.validator,
      required this.onClick});

  final String label;
  final VoidCallback onClick;
  final TextEditingController value;
  final bool isPassword;
  final bool isAddress;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: StylesOfWidgets.textStyle1(
                fs: SizeOfWidget.sizeOfH4, fw: FontWeight.w700)),
        TextFormField(
          cursorColor: AppColors.primaryColor,
          obscureText: isPassword,
          readOnly: (isPassword || isAddress),
          validator: validator,
          maxLines: 1,
          // style: const TextStyle(overflow: TextOverflow.clip),
          decoration: InputDecoration(
            suffixIcon: (isPassword || isAddress)
                ? TextButton(
                    onPressed: onClick,
                    child: Text('Thay đổi',
                        style: StylesOfWidgets.textStyle1(
                            fw: FontWeight.w400,
                            fs: SizeOfWidget.sizeOfH3,
                            clr: AppColors.primaryColor)),
                  )
                : null,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(width: 0.5),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.placeholderColor,
                  width: 0.5), // Viền trong suốt khi không được focus
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.placeholderColor,
                  width: 0.5), // Viền trong suốt khi được focus
            ),
            fillColor: Colors.transparent,
            filled: false,
          ),
          controller: value,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
