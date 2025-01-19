class OrderDetail {
  int orderId;
  int productId;
  int quantity;
  int price;
  String note;
  String productName;

  OrderDetail({
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.note,
    required this.productName,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderId: json['orderId'],
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'],
      note: json['note'],
      productName: json['productName'],
    );
  }
}
