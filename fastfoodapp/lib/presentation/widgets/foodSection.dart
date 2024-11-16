import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';

class Foodsection extends StatelessWidget {
  final String foodImg;
  final String foodName;
  final String foodLocation;
  final String foodRating;
  final String foodTime;
  final String foodVoucher;

  const Foodsection({
    Key? key,
    required this.foodImg,
    required this.foodName,
    required this.foodLocation,
    required this.foodRating,
    required this.foodTime,
    required this.foodVoucher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            foodImg,
            width: 150,
            height: 150,
            fit: BoxFit.cover
          ),
          SizedBox(height: 8,),

          Row(
            children: [
              Text(
                foodName,
                style: TextStyle(
                  fontSize: SizeOfWidget.sizeOfH1,
                  color: Colors.black,
                  fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),

          Row(
            children: [
              Text(
                foodLocation,
                style: TextStyle(
                  fontSize: SizeOfWidget.sizeOfH3,
                  color: Colors.grey
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),

          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryColor,
                ),
                width: 40,
                height: 24,
                child: Center(
                  child: Text(
                    foodRating,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeOfWidget.sizeOfH4
                    ),
                  ),
                )
              ),

              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  foodTime + ".",
                  style: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH3,
                    color: Colors.grey
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 10),
                child: Text(
                  foodVoucher,
                  style: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH3,
                    color: Colors.grey
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}