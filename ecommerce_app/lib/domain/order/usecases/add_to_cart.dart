import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/data/order/models/add_to_cart_request.dart';
import 'package:ecommerce_app/domain/order/repository/order.dart';

import '../../../service_locator.dart';

class AddToCartUseCase implements Usecase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return await getIt<OrderRepository>().addToCart(params!);
  }
}
