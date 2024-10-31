import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_app/domain/order/usecases/get_cart_products.dart';
import 'package:ecommerce_app/domain/order/usecases/remove_cart_product.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:meta/meta.dart';

part 'cart_products_display_state.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts() async {
    var returnedData = await getIt<GetCartProductsUseCase>().call();
    returnedData.fold((error) {
      emit(LoadCartProductsFailure(error));
    }, (data) {
      emit(CartProductsLoaded(data));
    });
  }

  void removeCartProducts(ProductOrderedEntity product) async {
    emit(CartProductsLoading());
    var returnedData =
        await getIt<RemoveCartProductUseCase>().call(params: product.id);

    returnedData.fold((error) {
      emit(LoadCartProductsFailure(error));
    }, (data) {
      displayCartProducts();
    });
  }
}
