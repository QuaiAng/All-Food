import 'package:flutter/material.dart';

class SettingsComponent extends StatefulWidget {
  final Icon iconSetting;
  final String STiyle;
  final String SContent;

  const SettingsComponent({
  Key? key,
   required this.iconSetting, 
   required this.STiyle, 
   required this.SContent
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => SComponent();
}

class SComponent extends State<SettingsComponent>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
      ],
    );
  }

}