class Usermodel {
  final int userId;
  final String userName;
  final String password;
  final String fullName;
  final String email;
  final String phone;
  final String imageURL;

  const Usermodel({
    required this.userId,
    required this.imageURL,
    required this.userName,
    required this.password,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  Usermodel.withoutIdAndImage({
    required this.userName,
    required this.password,
    required this.fullName,
    required this.email,
    required this.phone,
  })  : userId = 0,
        imageURL = '';
}
