import 'package:fastfoodapp/data/models/ProductModel.dart';
import 'package:fastfoodapp/data/services/ProductService.dart';

class Productrepository {
  final Productservice _productservice;
  const Productrepository(this._productservice);

  Future<List<Productmodel>> SearchProductByName(String keyword) async {
    //Thêm các bước kiểm tra nghiệp vụ ở đây nha
    final response = await _productservice.SearchProductByName(keyword);
    List<Productmodel> list =
        response.map((product) => Productmodel.fromJSON(product)).toList();
    return list;
  }
}
