class Productmodel {
  final int productId;
  final String productName;
  final int price;
  final String description;
  final int categoryId;
  final int shopId;
  final int salesCount;
  final int available;

  const Productmodel({
    required this.productId,
    required this.productName,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.shopId,
    required this.salesCount,
    required this.available,
  });

  factory Productmodel.fromJSON(Map<String, dynamic> json) => Productmodel(
      productId: json['productId'],
      productName: json['productName'],
      price: json['price'],
      description: json['description'],
      categoryId: json['categoryId'],
      shopId: json['shopId'],
      salesCount: json['salesCount'],
      available: json['available']); //Nhìn vào response từ API để viết chính xác key, nếu không sẽ lỗi null
}
