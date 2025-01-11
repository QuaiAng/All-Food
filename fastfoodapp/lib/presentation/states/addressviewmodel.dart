import 'package:fastfoodapp/data/models/AddressModel.dart';
import 'package:fastfoodapp/data/repositories/AddressRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addressviewmodel extends ChangeNotifier {
  List<Address> listAddressUser = [];
  Future<String>? addressCurrent = null;

  Addressrepository _addressrepository;
  Addressviewmodel(this._addressrepository);

  Future<void> getAddress() async {
    List<Address>? _address = await _addressrepository
        .getAddress(); // tạo ra 1 list để hứng hoặc copy từ list bên repository qua.
    if (_address != null) {
      if (listAddressUser.isNotEmpty) {
        for (int i = 0; i < _address.length; i++) {
          if (listAddressUser[i].addressId != _address[i].addressId) {
            listAddressUser.add(_address[i]); // sau đó in ra.
          }
        }
      } else {
        for (int i = 0; i < _address!.length; i++) {
          listAddressUser.add(_address[i]); // sau đó in ra.
        }
      }
    }
  }

  Future<String> getAddressCurrent() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (!_prefs.containsKey('addressCurrent')) {
      return 'Chưa chọn địa chỉ mặc định';
    }
    Address? _address = await _addressrepository
        .getAddressById(_prefs.getInt('addressCurrent')!);
    return _address == null ? '' : _address.address;
  }

  Future<bool> deleteAddressById(int addressId) async {
    listAddressUser.removeWhere((item) => item.addressId == addressId);
    final flag = await _addressrepository.deleteAddressById(addressId);
    notifyListeners();
    return flag;
  }

  Future<bool> saveAddressByIdCurrent(int addressIdCurrent) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final result = await _prefs.setInt('addressCurrent', addressIdCurrent);
    notifyListeners();
    return result;
  }
}
