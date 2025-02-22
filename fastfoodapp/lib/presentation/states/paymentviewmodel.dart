import 'package:fastfoodapp/data/models/User.dart';
import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:fastfoodapp/presentation/widgets/iteminpayment.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Paymentviewmodel extends ChangeNotifier {
  // final List _items = List.generate(12, (index) {
  //   return const Itemrow(
  //     quantity: 3,
  //     name: "Gà cay",
  //     description:
  //         "Lớp da gà giòn, cay Lớp da gà giòn, cay Lớp da gà giòn, cay",
  //     price: 32000.0,
  //   );
  // });

  // List get listProduct => _items;

  final Userrepository _userRepository;
  Paymentviewmodel(this._userRepository);

  Future<User?> getUserById() async {
    final response = await _userRepository.getUser();
    return response;
  }

}
