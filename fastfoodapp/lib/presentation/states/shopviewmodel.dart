import 'package:fastfoodapp/data/models/ShopModel.dart';
import 'package:fastfoodapp/data/repositories/ShopRepository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shopviewmodel extends ChangeNotifier {
  final Shoprepository _shoprepository;
  Shopviewmodel(this._shoprepository);

  Future<List<Shopmodel>> getListShopHighRating() async {
    final response = await _shoprepository.getListShopHighRating();
    return response;
  }

  Future<Shopmodel> getShopByShopID() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    Shopmodel shop =
        await _shoprepository.getShopByShopId(_prefs.getInt('shopID')!);

    return shop;
  }

  Future<Shopmodel> getShopId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final response =
        await _shoprepository.getShopByShopId(_prefs.getInt('shopId')!);
    return response;
  }
}
