import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/category/models/CategoryModel.dart';
import 'package:ecommerce_app/data/category/source/category_firebase_service.dart';
import 'package:ecommerce_app/domain/category/repository/category.dart';
import 'package:flutter/foundation.dart';

import '../../../service_locator.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await getIt<CategoryFirebaseService>().getCategories();
    return categories.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => CategoryModel.fromJson(e).toEntity())
          .toList());
    });
  }
}
