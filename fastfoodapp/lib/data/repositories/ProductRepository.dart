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
    final response = await _productservice.getProductByProductId(id);

    product = Productmodel.fromJSON(response?['data'] as Map<String, dynamic>);
    return product;
  }

  Future<List<Productmodel>> getListProductBestSeller() async {
    final response = await _productservice.getListProductBestSeller();
    List<Productmodel> products =
        response.map((product) => Productmodel.fromJSON(product)).toList();
    return products;
  }

  Future<Productmodel> getProductByProductId(int productId) async {
    final response = await _productservice.getProductByProductId(productId);
    Productmodel _product = Productmodel.fromJSON(response);
    return _product;
  }

  Future<List<Productmodel>> getProductsByCategoryId(int categoryId) async {
    final response = await _productservice.getProductByCategoryId(categoryId);
    List<Productmodel> products =
        response.map((product) => Productmodel.fromJSON(product)).toList();
    return products;
  }
}
