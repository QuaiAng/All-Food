import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/icon.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';

class SettingsComponent extends StatefulWidget {
  final int SIcon;
  final String STitle;
  final String SContent;

  const SettingsComponent({
  Key? key,
   required this.SIcon, 
   required this.STitle, 
   required this.SContent,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => SComponent();
}

class SComponent extends State<SettingsComponent>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(
            IconList.getIcon(widget.SIcon), 
            color: widget.SIcon == 5 ? AppColors.primaryColor : Colors.black,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.STitle,
                  style: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH3,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  widget.SContent,
                  style: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH4,
                    color: Colors.grey
                  ),
                )
              ],
            )
          ],
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios)
      ],
    );
  }

}