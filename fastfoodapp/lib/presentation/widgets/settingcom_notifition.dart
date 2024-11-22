import 'package:fastfoodapp/res/icon.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/res/colors.dart';

class SettingcomNotifition extends StatefulWidget {
  final int SIcon;
  final String STitle;
  final String SContent;

  const SettingcomNotifition({
  Key? key,
   required this.SIcon, 
   required this.STitle, 
   required this.SContent,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => SComponent();
}

class SComponent extends State<SettingcomNotifition>{
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(IconList.getIcon(widget.SIcon))
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
        Switch(
          value: isSwitched,
          onChanged: toggleSwitch,
          activeColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.primaryColor, 
          inactiveTrackColor: Colors.white,
        ),
      ],
    );
  }

}