class Address {
  late int addressId;
  late int userId;
  late String address;
  Address(
      {required this.addressId, required this.userId, required this.address});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
      addressId: json['addressId'],
      userId: json['userId'],
      address: json['address']);
}
