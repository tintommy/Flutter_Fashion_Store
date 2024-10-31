import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

import '../../../core/usecase/usecase.dart';

class ResetPassUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
