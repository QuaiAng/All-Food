import 'package:fastfoodapp/data/models/VoucherModel.dart';
import 'package:fastfoodapp/data/repositories/VoucherRepository.dart';
import 'package:flutter/material.dart';

class Voucherviewmodel extends ChangeNotifier{
  Voucherviewmodel(this._voucherrepository);
  final Voucherrepository _voucherrepository;

  List<Vouchermodel> listVoucher = [];
  
  Future<List<Vouchermodel>> getVoucher() async {
    List<Vouchermodel> response = await _voucherrepository.getVoucher();
    listVoucher = response;
    return response;
  }
}