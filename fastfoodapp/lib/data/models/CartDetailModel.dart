class Cartdetailmodel {
  final int productId;
  final int cartId;
  final int quantity;
  final int price;
  final int shopId;
  final String productName;
  final String productImageurl;
  final String description;
  final String shopName;
  Cartdetailmodel({
    required this.cartId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.shopId,
    required this.description,
    required this.productName,
    required this.productImageurl,
    required this.shopName,
  });

  factory Cartdetailmodel.fromJson(Map<String, dynamic> json) {
    return Cartdetailmodel(
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'],
      productImageurl: json['productImage'],
      description: json['description'],
      shopId: json['shopId'],
      productName: json['productName'],
      shopName: json['shopName'],
      cartId: json['cartId'],
    );
  }
}
