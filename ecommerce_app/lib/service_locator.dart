import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_app/data/category/repository/category.dart';
import 'package:ecommerce_app/data/category/source/category_firebase_service.dart';
import 'package:ecommerce_app/data/order/models/order_registration_req.dart';
import 'package:ecommerce_app/data/order/repository/order.dart';
import 'package:ecommerce_app/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_app/data/product/repository/product.dart';
import 'package:ecommerce_app/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce_app/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce_app/domain/auth/usecases/reset_pass.dart';
import 'package:ecommerce_app/domain/auth/usecases/signin.dart';
import 'package:ecommerce_app/domain/auth/usecases/signup.dart';
import 'package:ecommerce_app/domain/category/repository/category.dart';
import 'package:ecommerce_app/domain/category/usecase/get_categories.dart';
import 'package:ecommerce_app/domain/order/repository/order.dart';
import 'package:ecommerce_app/domain/order/usecases/add_to_cart.dart';
import 'package:ecommerce_app/domain/order/usecases/get_cart_products.dart';
import 'package:ecommerce_app/domain/order/usecases/order_registration.dart';
import 'package:ecommerce_app/domain/product/repository/product.dart';
import 'package:ecommerce_app/domain/product/usecases/add_or_remove_favorite.dart';
import 'package:ecommerce_app/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce_app/domain/product/usecases/get_products_by_category_id.dart';
import 'package:ecommerce_app/domain/product/usecases/get_products_by_title.dart';
import 'package:ecommerce_app/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce_app/domain/product/usecases/is_favorite.dart';
import 'package:get_it/get_it.dart';

import 'domain/auth/usecases/get_user.dart';
import 'domain/order/usecases/remove_cart_product.dart';
import 'domain/product/usecases/get_favorites_products.dart';

final getIt = GetIt.instance;

Future<void> initiallizeDependencies() async {
  //Service
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<CategoryFirebaseService>(
      CategoryFirebaseServiceImpl());
  getIt.registerSingleton<ProductFirebaseService>(
      ProductFirebaseServiceImpl());
  getIt.registerSingleton<OrderFirebaseService>(
      OrderFirebaseServiceImp());

  //Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  getIt.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  //Usecases
  getIt.registerSingleton<SignupUseCase>(SignupUseCase());
  getIt.registerSingleton<SignInUseCase>(SignInUseCase());
  getIt.registerSingleton<ResetPassUseCase>(ResetPassUseCase());
  getIt.registerSingleton<GetAgesUsecase>(GetAgesUsecase());
  getIt.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  getIt.registerSingleton<GetUserUsecase>(GetUserUsecase());



  getIt.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
  getIt.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  getIt.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  getIt.registerSingleton<GetProductsByCategoryIdUseCase>(GetProductsByCategoryIdUseCase());
  getIt.registerSingleton<GetProductsByTitleUseCase>(GetProductsByTitleUseCase());
  getIt.registerSingleton<AddOrRemoveFavoriteUseCase>(AddOrRemoveFavoriteUseCase());



  getIt.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
  getIt.registerSingleton<GetCartProductsUseCase>(GetCartProductsUseCase());
  getIt.registerSingleton<RemoveCartProductUseCase>(RemoveCartProductUseCase());
  getIt.registerSingleton<OrderRegistrationUseCase>(OrderRegistrationUseCase());
  getIt.registerSingleton<IsFavoriteUseCase>(IsFavoriteUseCase());
  getIt.registerSingleton<GetFavoritesProductsUseCase>(GetFavoritesProductsUseCase());

}
