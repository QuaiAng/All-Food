import 'dart:async';

import 'package:fastfoodapp/data/models/Address.dart';
import 'package:fastfoodapp/data/services/AddressService.dart';

class Addressrepository {
  final Addressservice _addressservice;
  Addressrepository(this._addressservice);

  Future<List<Address>?> getAddress() async {
    // final _address = await _addressservice.getAddress(); // hứng 1 list chứa map các đối tượng
    // print(_address);
    //   Address address = Address.fromJson(_address as Map<String, dynamic>); //  thực hiện việc chuyển map bên trong list thành các đối tượng Address và thêm nó vào list. 1 list mà các phần tử bên tỏng là các đối tượng đã được map sẵn.
    List<dynamic>? address = await _addressservice.getAddress();
    List<Address>? addressList =
        address!.map((address) => Address.fromJson(address)).toList();

    return addressList; // trả về 1 list đối tượng
  }

  Future<Address?> getAddressById(int addressId) async {
    Address address;
    final address0 = await _addressservice.getAddressById(addressId);
    if (address0!['addressId'] == 0) {
      throw Exception("AddressId by 0");
    } else if (address0['userId'] == 0) {
      throw Exception("UserID by 0");
    } else if (address0['address'].toString().isEmpty) {
      throw Exception("Address is null");
    } else if (address0['success'] == false) {
      return null;
    } else {
      address = Address.fromJson(address0['data']
          as Map<String, dynamic>); // chuyển từ json thành đối tượng Address
    }
    return address;
  }

  Future<bool> deleteAddressById(int addressId) async {
    final address = await _addressservice.deleteAddressById(addressId);
    if (address!['success'] == false) {
      return false;
    }
    return true;
  }
}
