import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/res/images.dart'; // File chứa đường dẫn ảnh

class Sectionfood extends StatelessWidget {
  final String foodImg;
  final String foodLocation;
  final double foodStart;
  final String foodRating;

  const Sectionfood({
    Key? key,
    required this.foodImg,
    required this.foodLocation,
    required this.foodStart,
    required this.foodRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hiển thị ảnh sản phẩm
          Image.asset(
            foodImg,
            width: SizeOfWidget.widthSection,
            height: SizeOfWidget.heightSection,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          
          // Hiển thị vị trí sản phẩm
          Row(
            children: [
              SizedBox(width: 4),
              Text(
                foodLocation,
                style: TextStyle(
                  fontSize: SizeOfWidget.sizeOfH3,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          
          // Hiển thị đánh giá
          Row(
            children: [
              Icon(Icons.star, color: Colors.orangeAccent, size: 20),
              SizedBox(width: 4),
              Text(
                foodStart.toString(),
                style: TextStyle(
                  fontSize: SizeOfWidget.sizeOfH3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '($foodRating nhận xét)',
                style: TextStyle(
                  fontSize: SizeOfWidget.sizeOfH3,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
