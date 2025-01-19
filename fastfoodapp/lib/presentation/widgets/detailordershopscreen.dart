import 'package:fastfoodapp/presentation/states/orderstatusviewmodel.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Detailordershop extends StatelessWidget {
  const Detailordershop({super.key});

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)?.settings.arguments as int;
    final orderViewModel = Provider.of<OrderStatusViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: Text(
          'CHI TIẾT HÓA ĐƠN',
          style: StylesOfWidgets.textStyle1(
            clr: Colors.red,
            fs: 20.sp,
            fw: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: orderViewModel.getOrderByOrderId(orderId),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            var orderModel = snapshot.data!;
            var orderDetail = snapshot.data!.orderDetails;
            return Container(
              height: 100.sp,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.gray, width: 0.5),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tên người đặt: ${orderModel.fullNameUser}',
                              style: StylesOfWidgets.textStyle1(
                                fs: 16.sp,
                                fw: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Địa chỉ giao hàng: ${orderModel.deliveryAddress}',
                              style: StylesOfWidgets.textStyle1(
                                  fs: 16.sp, fw: FontWeight.w400),
                            ),
                            Text(
                              'Số điện thoại nhận hàng: ${orderModel.phoneNum}',
                              style: StylesOfWidgets.textStyle1(
                                  fs: 16.sp, fw: FontWeight.w400),
                            ),
                            Text(
                              'Được gửi từ: ${orderModel.shopName}',
                              style: StylesOfWidgets.textStyle1(
                                  fs: 16.sp, fw: FontWeight.w400),
                            ),
                            Text(
                              'Ngày đặt: ${orderModel.date}',
                              style: StylesOfWidgets.textStyle1(
                                  fs: 16.sp, fw: FontWeight.w400),
                            ),
                            SizedBox(height: 16.sp),
                            Divider(),
                            SizedBox(
                              height: 100.sp,
                              child: ListView.builder(
                                itemCount: orderDetail.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tên món ăn: ${orderDetail[index].productName}",
                                              style: StylesOfWidgets.textStyle1(
                                                fs: 16.sp,
                                                fw: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Số lượng:  ${orderDetail[index].quantity}",
                                              style: StylesOfWidgets.textStyle1(
                                                  fs: 16.sp,
                                                  fw: FontWeight.w400),
                                            ),
                                            Text(
                                              'Giá tiền: ${orderDetail[index].price}đ',
                                              style: StylesOfWidgets.textStyle1(
                                                  fs: 16.sp,
                                                  fw: FontWeight.w400),
                                            ),
                                            Text(
                                              'Ghi chú: ${orderDetail[index].note}',
                                              style: StylesOfWidgets.textStyle1(
                                                  fs: 16.sp,
                                                  fw: FontWeight.w400),
                                            ),
                                            Text(
                                                'Trạng thái đơn:  ${orderModel.orderStatus == 0 ? "Đang chờ duyệt" : orderModel.orderStatus == 1 ? "Đang chuẩn bị" : orderModel.orderStatus == 2 ? "Đơn đã hoàn thành" : orderModel.orderStatus == 3 ? "Đơn hàng đã hủy" : "Không tồn tại"}',
                                                style:
                                                    StylesOfWidgets.textStyle1(
                                                        fs: 16.sp,
                                                        fw: FontWeight.w400)),
                                            Divider()
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text("Không tìm thấy dữ liệu");
          }
        },
      ),
    );
  }
}
