import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';

abstract class ProductRepository{

  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoritesProducts();

}