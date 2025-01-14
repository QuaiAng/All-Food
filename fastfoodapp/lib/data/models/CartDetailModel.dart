class Cartdetailmodel {
  final int productId;
  final int quantity;
  final int price;
  final int total;
  final int shopId;

  Cartdetailmodel({
    required this.productId,
    required this.quantity,
    required this.price,
    required this.total,
    required this.shopId,
  });

  factory Cartdetailmodel.fromJson(Map<String, dynamic> json) {
    return Cartdetailmodel(
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'],
      total: json['total'],
      shopId: json['shopId'],
    );
  }
}
