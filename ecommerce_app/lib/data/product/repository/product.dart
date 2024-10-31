import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/service_locator.dart';

import '../../../domain/product/repository/product.dart';
import '../models/product.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await getIt<ProductFirebaseService>().getTopSelling();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await getIt<ProductFirebaseService>().getNewIn();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getProductByCategoryId(String categoryId) async {
    var returnedData = await getIt<ProductFirebaseService>()
        .getProductByCategoriesId(categoryId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    var returnedData =
        await getIt<ProductFirebaseService>().getProductsByTitle(title);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    var returnedData = await getIt<ProductFirebaseService>()
        .addOrRemoveFavoriteProduct(product);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }

  @override
  Future<bool> isFavorite(String productId) async{
    return await getIt<ProductFirebaseService>().isFavorite(productId);
  }

  @override
  Future<Either> getFavoritesProducts()async {
    var returnedData = await getIt<ProductFirebaseService>().getFavoritesProducts();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList());
    });
  }
}
