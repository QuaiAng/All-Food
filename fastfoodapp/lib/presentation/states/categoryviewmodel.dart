import 'package:fastfoodapp/data/models/CategoryModel.dart';
import 'package:fastfoodapp/data/repositories/CategoryRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Categoryviewmodel extends ChangeNotifier {
  String nameCategory = '';

  final Categoryrepository _categoryrepository;
  Categoryviewmodel(this._categoryrepository);

  Future<String> getCategoryByCategoryId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final response = await _categoryrepository
        .getCategoryByCategoryId(_prefs.getInt('categoryID')!);
    nameCategory = response;
    return nameCategory;
    // notifyListeners();
  }
}
