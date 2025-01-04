import 'package:flutter/material.dart';

class IconList {
  static List<IconData> icons = [
    Icons.person,
    Icons.lock,
    Icons.payment,
    Icons.location_on,
    Icons.star,
    Icons.book,
    Icons.logout
  ];

  static IconData getIcon(int index){
    if(index >= 0 && index < icons.length){
      return icons[index];
    }else {
      return Icons.error;
    }
  }
}

