import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/order/models/order_registration_req.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repository/order.dart';

class OrderRegistrationUseCase implements Usecase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) async {
    return await getIt<OrderRepository>().orderRegistration(params!);
  }
}
