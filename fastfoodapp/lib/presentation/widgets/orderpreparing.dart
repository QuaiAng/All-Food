import 'package:fastfoodapp/presentation/states/orderstatusviewmodel.dart';
import 'package:fastfoodapp/presentation/pages/detailordershopscreen.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:fastfoodapp/utils/formatmoney.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Orderpreparing extends StatelessWidget {
  final bool role;
  const Orderpreparing({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderstatusViewModel = Provider.of<OrderStatusViewModel>(context);

    if (!role) {
      //Phía shop
      return FutureBuilder(
        future: orderstatusViewModel.getOrderByShopIdDoing(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            return SizedBox(
              height: 100.sp,
              child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      int orderId = snapshot.data![index].orderId;
                      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailordershop(),
                          settings: RouteSettings(arguments: orderId),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 0,
                      color: AppColors.backgroundColor,
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.sp),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Ảnh món ăn
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10), // Bo góc cho ảnh
                                child: Image.asset(
                                  'assets/images/bg.png',
                                  fit: BoxFit.cover,
                                  width: 50.sp, // Đặt chiều rộng cụ thể
                                  height: 60.sp, // Đặt chiều cao cụ thể
                                ),
                              ),
                              SizedBox(
                                  width: 12
                                      .sp), // Khoảng cách giữa ảnh và nội dung
                              // Nội dung thông tin đơn hàng
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Mã hóa đơn
                                        // Text(
                                        //   //orderModel.date,
                                        //   "Mã hóa đơn",
                                        //   style: StylesOfWidgets.textStyle1(
                                        //     clr: AppColors.gray,
                                        //     fs: SizeOfWidget.sizeOfH3,
                                        //   ),
                                        // ),

                                        SizedBox(height: 15.sp),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 18.sp,
                                              color: AppColors.gray,
                                            ),
                                            SizedBox(width: 4.sp),
                                            Expanded(
                                              child: Text(
                                                //orderModel.shopName,
                                                "Địa chỉ giao: ${snapshot.data![index].deliveryAddress}",
                                                style:
                                                    StylesOfWidgets.textStyle1(
                                                  clr: AppColors.gray,
                                                  fs: SizeOfWidget.sizeOfH3,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15.sp),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 18.sp,
                                              color: AppColors.gray,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Người nhận hàng: ${snapshot.data![index].fullNameUser}",
                                                style:
                                                    StylesOfWidgets.textStyle1(
                                                  clr: AppColors.gray,
                                                  fs: SizeOfWidget.sizeOfH3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15.sp),
                                        // Ngày tháng đặt
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              size: 18.sp,
                                              color: AppColors.gray,
                                            ),
                                            SizedBox(width: 4.sp),
                                            Expanded(
                                              child: Text(
                                                //orderModel.date,
                                                "Ngày đặt: ${snapshot.data![index].date}",
                                                style:
                                                    StylesOfWidgets.textStyle1(
                                                  clr: AppColors.gray,
                                                  fs: SizeOfWidget.sizeOfH3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15.sp),
                                        // Số lượng

                                        SizedBox(height: 20.sp),
                                      ],
                                    ),
                                    // Giá tiền (cố định ở đáy)
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.sp),
                                      child: Text(
                                        Formatmoney.formatCurrency(
                                            snapshot.data![index].total * 1.0),
                                        style: StylesOfWidgets.textStyle1(
                                          clr: AppColors.primaryColor,
                                          fs: SizeOfWidget.sizeOfH2,
                                          fw: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Nút "HỦY" (cố định góc dưới phải)
                        Positioned(
                          bottom: 10.sp,
                          right: 10.sp,
                          child: TextButton(
                            onPressed: () async{
                              // Xử lý khi nhấn nút HOÀN THÀNH
                              bool result = await orderstatusViewModel.changeStatusOrder(
                              snapshot.data![index].orderId, 2);
                          var snackBar = SnackBar(
                            content: Text(
                              result ? "Đơn đã hoàn thành" : "Đơn chưa thể hoàn thành",
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: result ? Colors.green : Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.sp,
                                vertical: 10.sp,
                              ),
                              backgroundColor:
                                  AppColors.primaryColor, // Không có màu nền
                              foregroundColor: Colors.white, // Màu chữ vàng
                              // side: const BorderSide(
                              //   // Viền vàng
                              //   color: AppColors.primaryColor,
                              //   width: 1.5,
                              // ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text("HOÀN THÀNH",
                                style: StylesOfWidgets.textStyle1(
                                    fs: SizeOfWidget.sizeOfH2,
                                    fw: FontWeight.w400,
                                    clr: Colors.white)),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text("Không tìm thấy dữ liệu"));
          }
        },
      );
    }

    return FutureBuilder(
      future: orderstatusViewModel.getOrderByUserIdDoing(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: snapshot
                .data!.length, //snapshot.data!.length, // Số lượng đơn hàng
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  color: AppColors.backgroundColor,
                  margin: EdgeInsets.symmetric(vertical: 8.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.sp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Ảnh món ăn
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10), // Bo góc cho ảnh
                            child: Image.asset(
                              'assets/images/bg.png',
                              fit: BoxFit.cover,
                              width: 50.sp, // Đặt chiều rộng cụ thể
                              height: 60.sp, // Đặt chiều cao cụ thể
                            ),
                          ),
                          SizedBox(
                              width: 12.sp), // Khoảng cách giữa ảnh và nội dung
                          // Nội dung thông tin đơn hàng
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Tên món ăn

                                    SizedBox(height: 15.sp),
                                    // Tên cửa hàng
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.storefront_outlined,
                                          size: 18.sp,
                                          color: AppColors.gray,
                                        ),
                                        SizedBox(width: 4.sp),
                                        Expanded(
                                          child: Text(
                                            snapshot.data![index].shopName,
                                            style: StylesOfWidgets.textStyle1(
                                              clr: AppColors.gray,
                                              fs: SizeOfWidget.sizeOfH3,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.sp),
                                    // Ngày tháng đặt
                                    Text(
                                      snapshot.data![index].date,
                                      style: StylesOfWidgets.textStyle1(
                                        clr: AppColors.gray,
                                        fs: SizeOfWidget.sizeOfH3,
                                      ),
                                    ),
                                    SizedBox(height: 15.sp),
                                    // Số lượng

                                    SizedBox(height: 20.sp),
                                  ],
                                ),
                                // Giá tiền (cố định ở đáy)
                                Padding(
                                  padding: EdgeInsets.only(top: 20.sp),
                                  child: Text(
                                    Formatmoney.formatCurrency(
                                        snapshot.data![index].total * 1.0),
                                    style: StylesOfWidgets.textStyle1(
                                      clr: AppColors.primaryColor,
                                      fs: SizeOfWidget.sizeOfH2,
                                      fw: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Nút "HỦY" (cố định góc dưới phải)
                    Positioned(
                        bottom: 15.sp,
                        right: 10.sp,
                        child: Text(
                          "Đang chuẩn bị đơn",
                          style: StylesOfWidgets.textStyle1(
                              fs: 16.sp, clr: AppColors.gray),
                        )),
                  ]),
                ),
              );
            },
          );
        }
      },
    );
  }
}
