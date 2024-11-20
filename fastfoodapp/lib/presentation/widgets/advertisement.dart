import 'package:fastfoodapp/main.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Listimageindicator extends StatelessWidget {
  const Listimageindicator({
    super.key,
    required this.images,
  });
  final List<String> images;

  Widget build(BuildContext context) {
    return SizedBox(
      //padding: const EdgeInsets.all(1),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context)
          .size
          .width, // Điều chỉnh chiều cao của carousel

      child: PageView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal, // Vuốt ngang
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.asset(
              images[index],
              fit: BoxFit.fill, // Điều chỉnh cách hiển thị ảnh
            ),
          );
        },
      ),
    );
  }
}
