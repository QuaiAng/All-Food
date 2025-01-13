import 'package:fastfoodapp/data/models/ProductModel.dart';
import 'package:fastfoodapp/data/models/ResultSearchModel.dart';
import 'package:fastfoodapp/data/services/ProductService.dart';

class Productrepository {
  final Productservice _productservice;
  const Productrepository(this._productservice);

  Future<List<Resultsearchmodel>> SearchProductByName(String keyword) async {
    //Thêm các bước kiểm tra nghiệp vụ ở đây nha

    final response = await _productservice.SearchProductByName(keyword);

    List<Resultsearchmodel> list =
        response.map((product) => Resultsearchmodel.fromJSON(product)).toList();
    return list;
  }

  Future<Productmodel?> getProductById(int id) async {
    Productmodel product;
    final response = await _productservice.getProductById(id);

    product = Productmodel.fromJSON(response?['data'] as Map<String, dynamic>);
    return product;
  }
}
