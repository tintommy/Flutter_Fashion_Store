import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/category/repository/category.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/domain/product/repository/product.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../auth/repository/auth.dart';

class AddOrRemoveFavoriteUseCase implements Usecase<Either, ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params}) async {
    return await getIt<ProductRepository>().addOrRemoveFavoriteProduct(params!);
  }
}
