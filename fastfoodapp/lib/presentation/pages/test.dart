import 'package:fastfoodapp/presentation/widgets/sectionFood.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget{
  const Test({super.key});

  @override
  Widget build(Object context) {
    return ListView(
      children: [
        Sectionfood(
          foodImg: Imagepath.logo, 
          foodLocation: 'Quận 1', 
          foodStart: 4.5, 
          foodRating: 'tuyệt'
        ),
         Sectionfood(
          foodImg: Imagepath.logo, 
          foodLocation: 'Quận 1', 
          foodStart: 4.5, 
          foodRating: 'tuyệt'
        )
      ],
    );
  }
}