import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

import '../../../core/usecase/usecase.dart';

class SignInUseCase implements Usecase<Either, UserSignInReq> {
  @override
  Future<Either> call({UserSignInReq? params}) async {
    return await getIt<AuthRepository>().signIn(params!);
  }
}
