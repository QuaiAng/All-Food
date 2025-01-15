import 'package:fastfoodapp/data/models/CategoryModel.dart';
import 'package:fastfoodapp/data/repositories/CategoryRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Categoryviewmodel extends ChangeNotifier {
  String nameCategory = '';

  final Categoryrepository _categoryrepository;
  Categoryviewmodel(this._categoryrepository);

  Future<String> getCategoryByCategoryId(int categoryId) async {
    final response =
        await _categoryrepository.getCategoryByCategoryId(categoryId);
    nameCategory = response;
    return nameCategory;
    // notifyListeners();
  }

  List<Categorymodel> _categories = [];

  List<Categorymodel> get categories => _categories;

  Future<List<Categorymodel>> getCategoriesByShopId(int shopId) async {
    try {
      final response = await _categoryrepository.getCategoriesByShopId(shopId);
      return response;
    } catch (e) {
      print("Lỗi khi lấy danh mục: $e");
      throw Exception(e);
    }
  }
}
