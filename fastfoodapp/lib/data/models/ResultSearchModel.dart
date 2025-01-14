class Resultsearchmodel {
  final int productId;
  final String productName;
  final String shopName;
  final String shopAddress;
  final int price;

  const Resultsearchmodel({
    required this.productId,
    required this.productName,
    required this.shopName,
    required this.shopAddress,
    required this.price,
  });

  factory Resultsearchmodel.fromJSON(Map<String, dynamic> json) =>
      Resultsearchmodel(
          productId: json['productId'],
          productName: json['productName'],
          shopName: json['shopName'],
          shopAddress: json['shopAddress'],
          price: json['price']);
}
