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
    final controller = PageController();
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context)
              .size
              .width, // Điều chỉnh chiều cao của carousel
          child: PageView.builder(
            controller: controller,
            itemCount: images.length,
            scrollDirection: Axis.horizontal, // Vuốt ngang
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.fill, // Điều chỉnh cách hiển thị ảnh
              );
            },
          ),
        ),
        Positioned(
          bottom: 18.0.sp,
          right: 18.0.sp,
          child: SmoothPageIndicator(
            controller: controller,
            count: images.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.grey,
              dotColor: Colors.white,
              dotHeight: 12.sp,
              dotWidth: 13.sp,
            ),
          ),
        ),
      ],
    );
  }
}
