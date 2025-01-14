import 'package:fastfoodapp/data/models/CategoryModel.dart';
import 'package:fastfoodapp/data/services/CategoryService.dart';

class Categoryrepository {
  Categoryservice _categoryservice;
  Categoryrepository(this._categoryservice);

  Future<String> getCategoryByCategoryId(int categoryId) async {
    final response = await _categoryservice.getCategoryByCategoryId(categoryId);
    // xử lí kiểm tra dữ liệu
    Categorymodel category = Categorymodel.fromJSON(response['data']);

    return category.categoryName;
  }
}
