class Shopmodel {
  final int shopId;
  final int userId;
  final String shopName;
  final String address;
  final String phone;
  final String imageURL;
  final double rating;

  Shopmodel({
    required this.shopId,
    required this.userId,
    required this.shopName,
    required this.address,
    required this.phone,
    required this.rating,
    required this.imageURL,
  });

  factory Shopmodel.fromJSON(Map<String, dynamic> json) {
    return Shopmodel(
      shopId: json['shopId'],
      userId: json['userId'],
      shopName: json['shopName'],
      address: json['address'],
      phone: json['phone'],
      rating: json['rating'] * 1.0,
      imageURL: json['imageURL'],
    );
  }
}
