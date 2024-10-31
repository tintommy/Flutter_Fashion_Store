import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repository/order.dart';

class GetCartProductsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic? params}) async {
    return await getIt<OrderRepository>().getCartProducts();
  }
}
