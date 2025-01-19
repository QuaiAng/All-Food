import 'package:fastfoodapp/data/models/OrderModel.dart';
import 'package:fastfoodapp/presentation/states/orderstatusviewmodel.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/productwatting.dart';
import '../widgets/waitingforapprovalsection.dart';

class Waitingforapprovalscreen extends StatelessWidget {
  Waitingforapprovalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderWaiting = Provider.of<OrderStatusViewModel>(context);

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
              )),
          title: Text(
            'CHỜ DUYỆT',
            style: TextStyle(
                fontSize: SizeOfWidget.sizeOfH2, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: orderWaiting.getOrderByUserIdNotComplete(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return SizedBox(
                height: 200.sp,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index].orderDetails;
                    return Waitingforapprovalsection(
                      shopName: snapshot.data![index].shopName,
                      price: product[index].price,
                      productName: product[index].productName,
                      onAccept: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Đã xác nhận sản phẩm ${product[index].productName}')),
                        );
                      },
                      onCancel: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Đã hủy sản phẩm ${product[index].productName}')),
                        );
                      },
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text("Không tìm thấy dữ liệu"),
              );
            }
          },
        ),
      ),
    );
  }
}
