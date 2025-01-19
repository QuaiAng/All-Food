import 'package:fastfoodapp/data/models/ShopModel.dart';
import 'package:fastfoodapp/data/services/ShopService.dart';

class Shoprepository {
  final Shopservice _shopService;
  Shoprepository(this._shopService);

  Future<List<Shopmodel>> getListShopHighRating() async {
    final response = await _shopService.getListShopHighRating();
    List<Shopmodel> _shop =
        response.map((shop) => Shopmodel.fromJSON(shop)).toList();
    return _shop;
  }

  Future<Shopmodel> getShopByShopId(int shopID) async {
    final response = await _shopService.getShopByShopId(shopID);
    print(response);

    // xử lí kiểm tra dữ liệu trả về
    Shopmodel _shop =
        Shopmodel.fromJSON(response['data'] as Map<String, dynamic>);
    return _shop;
  }
}
