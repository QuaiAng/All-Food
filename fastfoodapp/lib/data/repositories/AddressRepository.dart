import 'dart:async';

import 'package:fastfoodapp/data/models/Address.dart';
import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:fastfoodapp/data/services/AddressService.dart';

class Addressrepository {
  Addressservice _addressservice;
  Addressrepository(this._addressservice);

  Future<List<Address>?> getAddress() async {
    // final _address = await _addressservice.getAddress(); // hứng 1 list chứa map các đối tượng
    // print(_address);
    //   Address address = Address.fromJson(_address as Map<String, dynamic>); //  thực hiện việc chuyển map bên trong list thành các đối tượng Address và thêm nó vào list. 1 list mà các phần tử bên tỏng là các đối tượng đã được map sẵn.

    List<dynamic>? _address = await _addressservice.getAddress();
    List<Address>? _addressList = _address!.map((address) {
      return Address.fromJson(address);
    }).toList();
    return _addressList; // trả về 1 list đối tượng
  }

  Future<Address?> getAddressId() async {
    Address address;
    final _address = await _addressservice.getAddressId();
    if (_address!['addressId'] == 0) {
      throw Exception("AddressId by 0");
    } else if (_address!['userId'] == 0) {
      throw Exception("UserID by 0");
    } else if (_address!['address'].toString().isEmpty) {
      throw Exception("Address is null");
    } else {
      address = Address.fromJson(_address
          as Map<String, dynamic>); // chuyển từ json thành đối tượng Address
    }
    return address;
  }
}
