class Resultsearchmodel {
  final int productId;
  final String productName;
  final String shopName;
  final String shopAddress;
  final int price;
  final String imageURL;

  const Resultsearchmodel({
    required this.productId,
    required this.productName,
    required this.shopName,
    required this.shopAddress,
    required this.price,
    required this.imageURL,
  });

  factory Resultsearchmodel.fromJSON(Map<String, dynamic> json) =>
      Resultsearchmodel(
          productId: json['productId'],
          productName: json['productName'],
          shopName: json['shopName'],
          shopAddress: json['shopAddress'],
          price: json['price'],
          imageURL: json['imageUrl']);
}
