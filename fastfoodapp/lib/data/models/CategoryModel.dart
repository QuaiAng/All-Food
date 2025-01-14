class Categorymodel {
  final int categoryId;
  final String categoryName;
  final int shopId;

  Categorymodel(
      {required this.categoryId,
      required this.categoryName,
      required this.shopId});

  factory Categorymodel.fromJSON(Map<String, dynamic> json) {
    return Categorymodel(
        categoryId: json['categoryId'],
        categoryName: json['categoryName'],
        shopId: json['shopId']);
  }
}
