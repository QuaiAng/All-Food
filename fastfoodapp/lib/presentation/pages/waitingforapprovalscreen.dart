import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/productwatting.dart';
import '../widgets/waitingforapprovalsection.dart';

class Waitingforapprovalscreen extends StatelessWidget{
  const Waitingforapprovalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
              size: 18.sp,
            )
          ),
        title: Text('CHỜ DUYỆT', style: TextStyle(fontSize: SizeOfWidget.sizeOfH2, fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return Waitingforapprovalsection(
            product: product,
            onAccept: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Đã xác nhận sản phẩm ${product.name}')),
              );
            },
            onCancel: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Đã hủy sản phẩm ${product.name}')),
              );
            },
          );
        },
      ),
    ),
    );
  }
}