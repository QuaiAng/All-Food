import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';

class IconList {
  static List<IconData> icons = [
    Icons.person,
    Icons.lock,
    Icons.payment,
    Icons.location_on,
    IconsaxBold.notification,
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

