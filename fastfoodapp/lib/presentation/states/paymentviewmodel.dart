
import 'package:fastfoodapp/presentation/widgets/iteminpaymentscreen.dart';
import 'package:flutter/material.dart';

class Paymentviewmodel extends ChangeNotifier {
  final List _items = List.generate(12, (index) {
    return const Itemrow(
      quantity: 3,
      name: "Gà cay",
      description:
          "Lớp da gà giòn, cay Lớp da gà giòn, cay Lớp da gà giòn, cay",
      price: 32000.0,
    );
  });

  List get listProduct => _items;
}
