import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/user.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) {
    return getIt<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() {
    return getIt<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signIn(UserSignInReq user) async {
    return await getIt<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await getIt<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await getIt<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await getIt<AuthFirebaseService>().getUser();
    return user.fold((error) {
      return Left(error);
    }, (data)  async {
      return Right( UserModel.fromJson( data).toEntity());
    });
  }
}
