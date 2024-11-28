class Productwatting {
  final int id;
  final String name;
  final String price;
  final int quantity;
  final String user;
  final String image;

  Productwatting({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.user,
    required this.image,
  });
}

final List<Productwatting> productList = [
  Productwatting(
    id: 1,
    name: 'Khoai tây chiên',
    price: '56,000',
    quantity: 1,
    user: 'User XYZ',
    image: 'assets/images/logo.png',
  ),
  Productwatting(
    id: 2,
    name: 'Khoai tây chiên',
    price: '56,000',
    quantity: 1,
    user: 'User XYZ',
    image: 'assets/images/logo.png',
  ),
  Productwatting(
    id: 3,
    name: 'Khoai tây chiên',
    price: '56,000',
    quantity: 1,
    user: 'User XYZ',
    image: 'assets/images/logo.png',
  ),
];
