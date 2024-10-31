part of 'products_display_cubit.dart';

@immutable
sealed class ProductsDisplayState {}

final class ProductsDisplayInit extends ProductsDisplayState {}
final class ProductsDisplayLoading extends ProductsDisplayState {}
final class ProductsDisplayLoaded extends ProductsDisplayState {
  List<ProductEntity> products;

  ProductsDisplayLoaded(this.products);
}
final class ProductsDisplayFailure extends ProductsDisplayState {

  String error;

  ProductsDisplayFailure(this.error);
}
