import 'package:fastfoodapp/data/models/ReviewModel.dart';
import 'package:fastfoodapp/data/repositories/ReviewRepository.dart';
import 'package:fastfoodapp/presentation/states/editinfoviewmodel.dart';
import 'package:flutter/material.dart';

class Reviewviewmodel extends ChangeNotifier {
  final Reviewrepository _reviewrepository;
  Reviewviewmodel(this._reviewrepository);

  Future<List<Reviewmodel>> getListReviewByProductId(int productId) async {
    final reviews = await _reviewrepository.getListReviewByProductId(
        productId); // trả về 1 đối tượng ReviewModel vì có productId
    return reviews;
  }
}
