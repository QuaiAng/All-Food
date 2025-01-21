import 'package:fastfoodapp/presentation/states/orderstatusviewmodel.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
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
        backgroundColor: Colors.white,
        surfaceTintColor: AppColors.backgroundColor,
        shadowColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
        title: Text(
          "QUẢN LÝ ĐƠN HÀNG",
          style: StylesOfWidgets.textStyle1(
              fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
        ),
        centerTitle: true,
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
              height: 200.sp,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'THÔNG TIN ĐƠN HÀNG',
                                    style: StylesOfWidgets.textStyle1(
                                      fs: 17.sp,
                                      fw: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                'Tên khách hàng: ${orderModel.fullNameUser}',
                                style: StylesOfWidgets.textStyle1(
                                    fs: 16.sp, fw: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                'Địa chỉ giao hàng: ${orderModel.deliveryAddress}',
                                style: StylesOfWidgets.textStyle1(
                                    fs: 16.sp, fw: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                'Số điện thoại nhận hàng: ${orderModel.phoneNum}',
                                style: StylesOfWidgets.textStyle1(
                                    fs: 16.sp, fw: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                'Được gửi từ : ${orderModel.shopName}',
                                style: StylesOfWidgets.textStyle1(
                                    fs: 16.sp, fw: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                'Ngày đặt : ${orderModel.date}',
                                style: StylesOfWidgets.textStyle1(
                                    fs: 16.sp, fw: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Trạng thái đơn: ',
                                    style: StylesOfWidgets.textStyle1(
                                        fs: 16.sp, fw: FontWeight.w400),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: orderModel.orderStatus ==
                                              0
                                          ? Colors.blue
                                          : orderModel.orderStatus == 1
                                              ? Colors.orange
                                              : orderModel.orderStatus == 2
                                                  ? Colors.green
                                                  : orderModel.orderStatus == 3
                                                      ? Colors.red
                                                      : Colors.white, // Màu nền
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.sp,
                                          vertical:
                                              10.sp), // Kích thước padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5), // Bo góc
                                      ),
                                    ),
                                    child: Text(
                                        '${orderModel.orderStatus == 0 ? "Đang chờ duyệt" : orderModel.orderStatus == 1 ? "Đang chuẩn bị" : orderModel.orderStatus == 2 ? "Đơn đã hoàn thành" : orderModel.orderStatus == 3 ? "Đơn hàng đã hủy" : "Không tồn tại"}',
                                        style: StylesOfWidgets.textStyle1(
                                            fs: 16.sp,
                                            clr: Colors.white,
                                            fw: FontWeight.w400)),
                                  ),
                                  // const Divider()
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16.sp),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'THÔNG TIN CHI TIẾT',
                                    style: StylesOfWidgets.textStyle1(
                                      fs: 17.sp,
                                      fw: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.sp,
                              ),
                              SizedBox(
                                height: 250.sp,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: orderDetail.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15.sp,
                                        ),
                                        Text(
                                          "Tên món:  ${orderDetail[index].productName}",
                                          style: StylesOfWidgets.textStyle1(
                                              fs: 16.sp, fw: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                        ),
                                        Text(
                                          "Số lượng:  ${orderDetail[index].quantity}",
                                          style: StylesOfWidgets.textStyle1(
                                              fs: 16.sp, fw: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                        ),
                                        Text(
                                          'Giá tiền: ${orderDetail[index].price}đ',
                                          style: StylesOfWidgets.textStyle1(
                                              fs: 16.sp, fw: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                        ),
                                        Text(
                                          'Ghi chú: ${orderDetail[index].note}',
                                          style: StylesOfWidgets.textStyle1(
                                              fs: 16.sp, fw: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                        ),
                                        SizedBox(
                                          height: 10.sp,
                                        ),
                                        Divider()
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          // DataTable(
                          //   columns: [
                          //     DataColumn(label: Text('Thông Tin')),
                          //     DataColumn(label: Text('Chi tiết')),
                          //   ],
                          //   rows: [
                          //     DataRow(cells: [
                          //       DataCell(
                          //         Text(
                          //           'Tên người đặt:',
                          //           style: StylesOfWidgets.textStyle1(
                          //             fs: 16.sp,
                          //             fw: FontWeight.w400,
                          //           ),
                          //         ),
                          //       ),
                          //       DataCell(
                          //         Text(
                          //           '${orderModel.fullNameUser}',
                          //           style: StylesOfWidgets.textStyle1(
                          //             fs: 16.sp,
                          //             fw: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ]),
                          //     DataRow(cells: [
                          //       DataCell(
                          //         Text(
                          //           'Số điện thoại nhận hàng:',
                          //           style: StylesOfWidgets.textStyle1(
                          //               fs: 15.sp,
                          //               fw: FontWeight.w400,
                          //               clr: Colors.black),
                          //         ),
                          //       ),
                          //       DataCell(
                          //         Text(
                          //           orderModel.phoneNum,
                          //           style: StylesOfWidgets.textStyle1(
                          //               fs: 1.sp,
                          //               fw: FontWeight.w400,
                          //               clr: Colors.black),
                          //         ),
                          //       ),
                          //     ]),
                          //     DataRow(cells: [
                          //       DataCell(
                          //         Text(
                          //           'Ngày đặt: ${orderModel.date}',
                          //           style: StylesOfWidgets.textStyle1(
                          //               fs: 16.sp, fw: FontWeight.w400),
                          //         ),
                          //       ),
                          //       DataCell(
                          //         Text(
                          //           'Ngày đặt: ${orderModel.date}',
                          //           style: StylesOfWidgets.textStyle1(
                          //               fs: 16.sp, fw: FontWeight.w400),
                          //         ),
                          //       ),
                          //       // DataCell(Text('5FRD4R33')),
                          //     ]),
                          //   ],
                          // ),
                        ],
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
