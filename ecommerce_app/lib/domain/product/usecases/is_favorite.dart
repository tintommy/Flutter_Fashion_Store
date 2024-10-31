import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repository/product.dart';

class IsFavoriteUseCase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await getIt<ProductRepository>().isFavorite(params!);
  }
}
