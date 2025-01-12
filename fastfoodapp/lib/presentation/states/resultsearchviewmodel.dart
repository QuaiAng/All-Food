import 'package:fastfoodapp/data/models/ProductModel.dart';
import 'package:fastfoodapp/data/repositories/ProductRepository.dart';
import 'package:flutter/material.dart';

class Resultsearchviewmodel extends ChangeNotifier {
  final Productrepository _productrepository;
  Resultsearchviewmodel(this._productrepository);

  List<Productmodel> listProduct = [];

  Future<List<Productmodel>> SearchProductByName(String keyword) async {
    List<Productmodel> response =
        await _productrepository.SearchProductByName(keyword);
    listProduct = response;
    return response;
  }

  Future<List<Productmodel>> getListProductBestSeller() async {
    final response = await _productrepository.getListProductBestSeller();
    return response;
  }
}
