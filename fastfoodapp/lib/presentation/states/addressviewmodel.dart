import 'package:fastfoodapp/data/models/Address.dart';
import 'package:fastfoodapp/data/repositories/AddressRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addressviewmodel extends ChangeNotifier {
  List<Address> listAddressUser = [];
  Future<String>? addressCurrent;

  final Addressrepository _addressrepository;
  Addressviewmodel(this._addressrepository);

  Future<void> getAddress() async {
    List<Address>? address = await _addressrepository
        .getAddress(); // tạo ra 1 list để hứng hoặc copy từ list bên repository qua.
    if (address != null) {
      if (listAddressUser.isNotEmpty) {
        for (int i = 0; i < address.length; i++) {
          if (listAddressUser[i].addressId != address[i].addressId) {
            listAddressUser.add(address[i]); // sau đó in ra.
          }
        }
      } else {
        for (int i = 0; i < address.length; i++) {
          listAddressUser.add(address[i]); // sau đó in ra.
        }
      }
    }
  }

  Future<String> getAddressCurrent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('addressCurrent')) {
      return 'Chưa chọn địa chỉ mặc định';
    }
    Address? address = await _addressrepository
        .getAddressById(prefs.getInt('addressCurrent')!);
    return address == null ? '' : address.address;
  }

  Future<bool> deleteAddressById(int addressId) async {
    listAddressUser.removeWhere((item) => item.addressId == addressId);
    final flag = await _addressrepository.deleteAddressById(addressId);
    notifyListeners();
    return flag;
  }

  Future<bool> saveAddressByIdCurrent(int addressIdCurrent) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setInt('addressCurrent', addressIdCurrent);
    notifyListeners();
    return result;
  }
}
