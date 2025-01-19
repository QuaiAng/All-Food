class Reviewmodel {
  late int reviewId;
  late int productId;
  late int userId;
  late String comment;
  late int rating;
  late String date;
  late String fullName;

  Reviewmodel(
      {required this.reviewId,
      required this.productId,
      required this.userId,
      required this.comment,
      required this.rating,
      required this.fullName,
      required this.date});

  factory Reviewmodel.fromJSON(Map<String, dynamic> json) {
    return Reviewmodel(
        reviewId: json['reviewId'],
        productId: json['productId'],
        userId: json['userId'],
        comment: json['comment'],
        rating: json['rating'],
        fullName: json['fullName'],
        date: json['date']);
  }
}
