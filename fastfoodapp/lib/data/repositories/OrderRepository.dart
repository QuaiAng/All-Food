import 'package:fastfoodapp/data/models/OrderModel.dart';
import 'package:fastfoodapp/data/services/OrderService.dart';

class Orderrepository {
  final Orderservice _orderservice;
  Orderrepository(this._orderservice);

  Future<List<OrderModel>?> getOrderByUserId(int userID) async {
    List<OrderModel>? listOrder;

    try {
      List? order = await _orderservice.getOrderByUserId(userID);
      listOrder = order!.map((item) => OrderModel.fromJson(item)).toList(); //map sai gì rồi
      return listOrder;
    } catch (error) {
      throw Exception('Error in OrderRepository: $error');
    }
  }
}
