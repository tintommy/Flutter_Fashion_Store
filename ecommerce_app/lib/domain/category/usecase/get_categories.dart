import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/category/repository/category.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../auth/repository/auth.dart';

class GetCategoriesUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await getIt<CategoryRepository>().getCategories();
  }
}
