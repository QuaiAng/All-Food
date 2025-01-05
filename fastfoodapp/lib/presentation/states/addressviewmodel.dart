import 'package:fastfoodapp/data/models/Address.dart';
import 'package:fastfoodapp/data/repositories/AddressRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addressviewmodel extends ChangeNotifier {
  List<Address> listAddressUser = [];
  String addressCurrent = '';

  Addressrepository _addressrepository;
  Addressviewmodel(this._addressrepository);

  Future<void> getAddress() async {
    List<Address>? _address = await _addressrepository
        .getAddress(); // tạo ra 1 list để hứng hoặc copy từ list bên repository qua.
    if (_address != null) {
      for (int i = 0; i < _address!.length; i++) {
        listAddressUser.add(_address[i]); // sau đó in ra.
      }
    }
  }

  Future<void> getAddressId() async {
    Address? _address = await _addressrepository.getAddressId();
    if (_address != null) {
      addressCurrent = _address.address;
    }
  }

  Future<bool> saveAddressId(int addressId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final result = await _prefs.setInt('addressId', addressId);
    return result;
  }
}
