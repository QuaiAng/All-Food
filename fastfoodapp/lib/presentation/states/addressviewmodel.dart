import 'package:fastfoodapp/data/models/Address.dart';
import 'package:fastfoodapp/data/repositories/AddressRepository.dart';
import 'package:flutter/material.dart';

class Addressviewmodel extends ChangeNotifier {
  List<String> listAddress = [];

  Addressrepository _addressrepository;
  Addressviewmodel(this._addressrepository);

  Future<void> getAddress() async {
    List<Address>? _address = await _addressrepository
        .getAddress(); // tạo ra 1 list để hứng hoặc copy từ list bên repository qua.
    if (_address != null) {
      for (int i = 0; i < _address!.length; i++) {
        listAddress.add(_address[i].address); // sau đó in ra.
      }
    }
  }
}
