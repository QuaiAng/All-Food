class Productmodel {
  final int productId;
  final String productName;
  final int price;
  final String description;
  final int categoryId;
  final int shopId;
  final int salesCount;
  final int available;
  final int rating;
  final String imageURL;
  final String shopAddress;

  const Productmodel(
      {required this.productId,
      required this.productName,
      required this.price,
      required this.description,
      required this.categoryId,
      required this.shopId,
      required this.salesCount,
      required this.available,
      required this.rating,
      required this.shopAddress,
      required this.imageURL});

  factory Productmodel.fromJSON(Map<String, dynamic> json) => Productmodel(
      productId: json['productId'],
      productName: json['productName'],
      price: json['price'],
      description: json['description'],
      categoryId: json['categoryId'],
      shopId: json['shopId'],
      salesCount: json['salesCount'],
      available: json['available'],
      rating: json['rating'],
      shopAddress: json['shopAddress'] ?? "",
      imageURL: json['imageUrl']);

  Productmodel.withoutShopAddress({
    required this.productId,
    required this.productName,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.shopId,
    required this.salesCount,
    required this.available,
    required this.rating,
  })  : shopAddress = "",
        imageURL = "";

  factory Productmodel.fromJSONWithoutShopAddress(Map<String, dynamic> json) =>
      Productmodel.withoutShopAddress(
        productId: json['productId'],
        productName: json['productName'],
        price: json['price'],
        description: json['description'],
        categoryId: json['categoryId'],
        shopId: json['shopId'],
        salesCount: json['salesCount'],
        available: json['available'],
        rating: json['rating'],
      );
}
