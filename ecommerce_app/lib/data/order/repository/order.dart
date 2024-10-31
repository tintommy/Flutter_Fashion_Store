import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/order/models/add_to_cart_request.dart';
import 'package:ecommerce_app/data/order/models/order_registration_req.dart';
import 'package:ecommerce_app/data/order/models/product_ordered.dart';
import 'package:ecommerce_app/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_app/domain/order/repository/order.dart';

import '../../../service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) {
    return getIt<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await getIt<OrderFirebaseService>().getCartProduct();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductOrderedModel.fromJson(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    var returnedData =
        await getIt<OrderFirebaseService>().removeCartProduct(id);
    return returnedData.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    var returnedData =
        await getIt<OrderFirebaseService>().orderRegistration(order);
    return returnedData.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }
}
