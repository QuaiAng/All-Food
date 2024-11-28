import 'package:fastfoodapp/res/colors.dart';
import 'package:flutter/material.dart';

class OrderStatusViewModel extends ChangeNotifier {
  // Các thuộc tính của đơn hàng
  int _orderStatus =
      0; // Trạng thái đơn hàng (ví dụ: 0: đang xử lý, 5: đã giao)
  int get orderStatus => _orderStatus;

  // Thời gian dự kiến giao hàng
  String get estimatedTime => _orderStatus != 5 ? "23m" : "--";

  // Mô tả trạng thái đơn hàng
  String get orderStatusDescription => _orderStatus != 5
      ? "Đơn hàng của bạn có thể được giao muộn hơn thời gian dự kiến do các yếu tố bên ngoài !"
      : "Đơn hàng của bạn đã được giao";

  // Màu sắc của background dựa trên trạng thái đơn hàng
  Color get backColor =>
      _orderStatus != 5 ? AppColors.primaryColor : Colors.green;

  // Cập nhật trạng thái đơn hàng
  void updateOrderStatus(int status) {
    _orderStatus = status;
    notifyListeners(); // Thông báo cho UI về sự thay đổi trạng thái
  }
}
