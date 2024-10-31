part of 'cart_products_display_cubit.dart';

@immutable
sealed class CartProductsDisplayState {}

final class CartProductsLoading extends CartProductsDisplayState {}
final class CartProductsLoaded extends CartProductsDisplayState {
  final List<ProductOrderedEntity> products;

  CartProductsLoaded(this.products);
}
final class LoadCartProductsFailure extends CartProductsDisplayState {
  final String error;

  LoadCartProductsFailure(this.error);
}