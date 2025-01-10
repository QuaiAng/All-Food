import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/productwatting.dart';

class Waitingforapprovalsection extends StatelessWidget {
  final Productwatting product;
  final VoidCallback onAccept;
  final VoidCallback onCancel;

  const Waitingforapprovalsection({
    super.key,
    required this.product,
    required this.onAccept,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              product.image,
              width: 48.sp,
              height: 53.sp,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: SizeOfWidget.sizeOfH2),
                ),
                SizedBox(height: 10.sp,),
                Row(
                  children: [
                    Text(
                      'Của ',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Text(
                      product.user,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.sp,),
                Text(
                  'Số lượng: ${product.quantity}',
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(height: 10.sp,),
                Text(
                  product.price,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 16.sp,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: onAccept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(22.sp, 28.sp)
                      ),
                      child: Text('XÁC NHẬN', style: TextStyle(color: Colors.white, fontSize: SizeOfWidget.sizeOfH3),),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: onCancel,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        side: const BorderSide(color: Colors.orange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(20.sp, 28.sp)
                      ),
                      child: const Text('HUỶ'),
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
