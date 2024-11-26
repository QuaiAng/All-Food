import 'package:flutter/material.dart';

class Listimageindicator extends StatelessWidget {
  const Listimageindicator(
      {super.key, required this.images, required this.isShop});
  final List<String> images;
  final bool isShop;

  @override
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
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isShop
                  ? Colors.black.withOpacity(0.5) // Màu đen với độ trong suốt khi `isShop` là true
                  : Colors.black.withOpacity(0), // Không làm tối khi `isShop` là false
                BlendMode.darken,
              ),
              child: Image.asset(
                images[index],
                fit: BoxFit.fill, // Điều chỉnh cách hiển thị ảnh
              ),
            ),
          );
        },
      ),
    );
  }
}
