import 'package:fastfoodapp/data/models/ProductModel.dart';

import 'package:fastfoodapp/data/models/ResultSearchModel.dart';

import 'package:fastfoodapp/data/repositories/ProductRepository.dart';
import 'package:flutter/material.dart';

class Resultsearchviewmodel extends ChangeNotifier {
  final Productrepository _productrepository;
  Resultsearchviewmodel(this._productrepository);

  final TextEditingController _keywordTextcontroller = TextEditingController();
  String selectedNewest = "GẦN ĐÂY";
  String selectedPrice = "GIÁ";
  bool isRelevantSelected = false;

  TextEditingController get keywordTextcontroller => _keywordTextcontroller;

  List<Resultsearchmodel> listProduct = [];
  List<Resultsearchmodel> filteredProducts = [];

  Future<List<Resultsearchmodel>> SearchProductByName(String keyword) async {
    List<Resultsearchmodel> response =
        await _productrepository.SearchProductByName(keyword);
    listProduct = response;
    return response;
  }

  // void updateNewest(String value) {
  //   selectedNewest = value;
  //   notifyListeners();
  // }

  // void applyPriceFilter(String value) {
  //   if (value == "35k - 100k") {
  //     listProduct = listProduct.where((item) => (item.price > 34 && item.price < 101)).toList();
  //   } else if (value == "100k - 200k") {
  //    listProduct = listProduct.where((item) => (item.price > 100 && item.price < 201))
  //         .toList();
  //   } else {
  //     listProduct = listProduct.where((item) => (item.price > 200)).toList();
  //   }
  //   notifyListeners();
  // }

  void updatePrice(String value) {
    selectedPrice = value;
    applyFilters();
  }

  void toggleRelevant() {
    isRelevantSelected = !isRelevantSelected;
    applyFilters();
    notifyListeners();
  }

  void applyFilters() {
    filteredProducts = listProduct.where((product) {
      bool matchPrice = selectedPrice == "GIÁ" ||
          (selectedPrice == '35k - 100k' &&
              product.price >= 35 &&
              product.price <= 100) ||
          (selectedPrice == '100k - 200k' &&
              product.price > 100 &&
              product.price <= 200) ||
          (selectedPrice == '>200k' && product.price > 200);
      return matchPrice;
    }).toList();

    if (isRelevantSelected) {
      sortByRelevance(); // Sắp xếp theo tiêu chí liên quan
    }
    notifyListeners();
  }

  void sortByRelevance() {
    filteredProducts.sort((a, b) =>
        a.productName.toLowerCase().compareTo(b.productName.toLowerCase()));
  }

  Future<List<Productmodel>> getListProductBestSeller() async {
    final response = await _productrepository.getListProductBestSeller();
    return response;
  }

  @override
  void dispose() {
    _keywordTextcontroller.dispose();
    super.dispose();
  }
}
