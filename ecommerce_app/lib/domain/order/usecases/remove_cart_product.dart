import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/domain/order/repository/order.dart';

import '../../../service_locator.dart';

class RemoveCartProductUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<OrderRepository>().removeCartProduct(params!);
  }
}
