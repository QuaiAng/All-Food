import 'package:fastfoodapp/data/models/CartDetailModel.dart';

class Cartmodel {
  final int cartId;
  final int userId;
  final int total;
  final List<Cartdetailmodel> cartDetails;

  Cartmodel({
    required this.cartId,
    required this.userId,
    required this.total,
    required this.cartDetails,
  });

  factory Cartmodel.fromJson(Map<String, dynamic> json) {
    return Cartmodel(
      cartId: json['cartId'],
      userId: json['userId'],
      total: json['total'],
      cartDetails: (json['cartDetails'] as List)
          .map((item) => Cartdetailmodel.fromJson(item))
          .toList(),
    );
  }
}
