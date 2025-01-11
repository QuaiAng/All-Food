class User {
  final int userId;
  final String userName;
  final String fullName;
  final String email;
  final String phone;
  final String imageURL;
  final String password = "";

  const User({
    required this.userId,
    required this.imageURL,
    required this.userName,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['userId'],
        imageURL: json['imageUrl'],
        userName: json['username'],
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone']);
  }
}
