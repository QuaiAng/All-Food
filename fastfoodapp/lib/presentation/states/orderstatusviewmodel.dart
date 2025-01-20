import 'package:fastfoodapp/data/models/OrderModel.dart';
import 'package:fastfoodapp/data/repositories/OrderRepository.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderStatusViewModel extends ChangeNotifier {
  final Orderrepository _orderrepository;
  OrderStatusViewModel(this._orderrepository);

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

  Future<List<OrderModel>?> getOrderByUserIdNotComplete() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId;
    if (_prefs.containsKey('userId')) {
      userId = _prefs.getInt('userId');
    } else {
      userId = 0;
    }
    final response = await _orderrepository.getOrderByUserId(userId);
    List<OrderModel> listOrderNotComplete = [];
    for (int i = 0; i < response!.length; i++) {
      if (response[i].orderStatus == 0) {
        listOrderNotComplete.add(response[i]);
      }
    }
    return listOrderNotComplete;
  }

  Future<List<OrderModel>?> getOrderByUserIdDoing() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId;
    if (_prefs.containsKey('userId')) {
      userId = _prefs.getInt('userId');
    } else {
      userId = 0;
    }
    final response = await _orderrepository.getOrderByUserId(userId);
    List<OrderModel> listOrderNotComplete = [];
    for (int i = 0; i < response!.length; i++) {
      if (response[i].orderStatus == 1) {
        listOrderNotComplete.add(response[i]);
      }
    }
    return listOrderNotComplete;
  }

  Future<List<OrderModel>?> getOrderByUserIdComplete() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId;
    if (_prefs.containsKey('userId')) {
      userId = _prefs.getInt('userId');
    } else {
      userId = 0;
    }
    final response = await _orderrepository.getOrderByUserId(userId);
    List<OrderModel>? listOrderComplete = [];

    for (int i = 0; i < response!.length; i++) {
      if (response[i].orderStatus == 2) {
        listOrderComplete.add(response[i]);
      }
    }
    return listOrderComplete;
  }

  Future<List<OrderModel>?> getOrderByUserIdCanceled() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId;
    if (_prefs.containsKey('userId')) {
      userId = _prefs.getInt('userId');
    } else {
      userId = 0;
    }
    final response = await _orderrepository.getOrderByUserId(userId);
    List<OrderModel>? listOrderComplete = [];

    for (int i = 0; i < response!.length; i++) {
      if (response[i].orderStatus == 3) {
        listOrderComplete.add(response[i]);
      }
    }
    return listOrderComplete;
  }

  Future<bool> cancelOrder(int orderId, int orderStatus) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    int? userId = _pref.getInt('userId');
    final response =
        await _orderrepository.cancelOrder(orderId, userId!, orderStatus);
    notifyListeners();
    return response;
  }

  Future<bool> addToOrder(OrderModel order) async {
    final response = await _orderrepository.addToOrder(order);
    notifyListeners();
    return response;
  }
}
