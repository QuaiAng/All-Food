import 'package:fastfoodapp/data/models/ReviewModel.dart';
import 'package:fastfoodapp/data/services/ReviewService.dart';

class Reviewrepository {
  final Reviewservice _reviewservice;
  Reviewrepository(this._reviewservice);

  Future<List<Reviewmodel>> getListReviewByProductId(int productId) async {
    final response = await _reviewservice.getListReviewByProductId(productId);

    List<Reviewmodel> _listReview =
        response.map((rv) => Reviewmodel.fromJSON(rv)).toList();
    return _listReview;
  }
}
