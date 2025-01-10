class Vouchermodel {
  final int voucherId;
  final int shopId;
  final String Title;
  final String Description;
  final int Discount;
  final String startDate;
  final String endDate;
  final int Quantity;
  final int paymentMethod;

  const Vouchermodel({
    required this.voucherId,
    required this.shopId,
    required this.Title,
    required this.Description,
    required this.Discount,
    required this.startDate,
    required this.endDate,
    required this.Quantity,
    required this.paymentMethod,
  });

  factory Vouchermodel.fromJSON(Map<String, dynamic> json) {
    return Vouchermodel(
      voucherId: json['voucherId'],
      shopId: json['shopId'],
      Title: json['title'],
      Description: json['description'],
      Discount: json['discount'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      Quantity: json['quantity'],
      paymentMethod: json['paymentMethod'],
    );
  }
}