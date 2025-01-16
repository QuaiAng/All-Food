import 'package:fastfoodapp/data/models/OrderDetail.dart';

class OrderModel {
  int orderId;
  String date;
  int total;
  String deliveryAddress;
  bool status;
  int paymentMethod;
  int orderStatus;
  double discount;
  String fullNameUser;
  String shopName;
  String phoneNum;
  int userId;
  List<OrderDetail> orderDetails;

  OrderModel({
    required this.orderId,
    required this.date,
    required this.total,
    required this.deliveryAddress,
    required this.status,
    required this.paymentMethod,
    required this.orderStatus,
    required this.discount,
    required this.fullNameUser,
    required this.shopName,
    required this.phoneNum,
    required this.userId,
    required this.orderDetails,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      date: json['date'],
      total: json['total'],
      deliveryAddress: json['deliveryAddress'],
      status: json['status'],
      paymentMethod: json['paymentMethod'],
      orderStatus: json['orderStatus'],
      discount: json['discount'],
      fullNameUser: json['fullNameUser'],
      shopName: json['shopName'],
      phoneNum: json['phoneNum'],
      userId: json['userId'],
      orderDetails: (json['orderDetails'] as List)
          .map((detail) => OrderDetail.fromJson(detail))
          .toList(),
    );
  }
}
