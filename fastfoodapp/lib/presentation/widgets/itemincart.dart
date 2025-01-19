import 'dart:io';

import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/strings.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Itemincart extends StatefulWidget {
  const Itemincart({
    super.key,
    required this.onTap,
    required this.image,
    required this.name,
    required this.note,
    required this.price,
    required this.quantity,
    required this.shopName,
  });

  final VoidCallback onTap;
  final String image;
  final String name;
  final String note;
  final String shopName;
  final int price;
  final int quantity;

  @override
  State<Itemincart> createState() => _ItemincartState();
}

class _ItemincartState extends State<Itemincart> {
  late int _quantity;
  late int _totalPrice;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
    _totalPrice = widget.price * _quantity;
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
      _totalPrice = widget.price * _quantity;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        _totalPrice = widget.price * _quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1/3 Row cho ảnh
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    "${AppStrings.urlAPI}/${widget.image}",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),

          // 2/3 Row cho text
          SizedBox(width: 15.sp),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w400),
                ),
                Text(
                  widget.note,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3,
                      fw: FontWeight.w400,
                      clr: AppColors.gray),
                ),
                SizedBox(height: 15.sp),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Từ ", // Phần văn bản còn lại
                        style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          fw: FontWeight.w400,
                          clr: Colors.black, // Màu đen hoặc xám
                        ),
                      ),
                      TextSpan(
                        text: widget.shopName,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3,
                            fw: FontWeight.w700,
                            clr: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Xử lý sự kiện click
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("You clicked on McDonald's!"),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: _decreaseQuantity,
                              icon: Icon(
                                Icons.remove,
                                color: AppColors.primaryColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              _quantity.toString(),
                              textAlign: TextAlign.center,
                              style: StylesOfWidgets.textStyle1(
                                  fs: SizeOfWidget.sizeOfH3),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: _increaseQuantity,
                              icon: Icon(
                                Icons.add,
                                color: AppColors.primaryColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          Formatmoney.formatCurrency(_totalPrice * 1.0),
                          softWrap: true,
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH3,
                              fw: FontWeight.w700,
                              clr: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
