import 'package:fastfoodapp/data/models/OrderModel.dart';
import 'package:fastfoodapp/data/services/OrderService.dart';

class Orderrepository {
  final Orderservice _orderservice;
  Orderrepository(this._orderservice);

  Future<List<OrderModel>?> getOrderByUserId(int userID) async {
    List<OrderModel>? listOrder;

    try {
      List? order = await _orderservice.getOrderByUserId(userID);
      listOrder = order!
          .map((item) => OrderModel.fromJson(item))
          .toList(); //map sai gì rồi
      return listOrder;
    } catch (error) {
      throw Exception('Error in OrderRepository: $error');
    }
  }

  Future<List<OrderModel>?> getOrderByShopId(int shopId) async {
    List<OrderModel>? listOrder = [];

    try {
      List? order = await _orderservice.getOrderByShopId(shopId);
      listOrder = order!.map((item) => OrderModel.fromJson(item)).toList();
      return listOrder;
    } catch (error) {
      throw Exception('Error in OrderRepository: $error');
    }
  }

  Future<OrderModel> getOrderByOderId(int orderID) async {
    try {
      final response = await _orderservice.getOrderByOrderId(orderID);
      OrderModel order = OrderModel.fromJson(response);

      return order;
    } catch (error) {
      throw Exception('Error in OrderRepository: $error');
    }
  }

  Future<bool> changeStatusOrder(
      int orderId, int userId, int orderStatus) async {
    try {
      final response =
          await _orderservice.changeStatusOrder(orderId, userId, orderStatus);
      return response['success'];
    } catch (error) {
      throw Exception('Error in OrderRepository: $error');
    }
  }

  Future<bool> addToOrder(OrderModel order) async {
    try {
      return await _orderservice.addToOrder(order);
    } catch (e) {
      throw Exception('Error in OrderRepository: $e');
    }
  }

  Future<bool> deleteOrder(int orderId) async {
    try {
      return await _orderservice.deleteOrder(orderId);
    } catch (e) {
      throw Exception('Error in OrderRepository: $e');
    }
  }
}
