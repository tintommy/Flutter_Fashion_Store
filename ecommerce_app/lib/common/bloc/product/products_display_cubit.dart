import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:meta/meta.dart';

import '../../../core/usecase/usecase.dart';

part 'products_display_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  ProductsDisplayCubit(this.usecase) : super(ProductsDisplayInit());
  final Usecase usecase;

  void displayProducts({dynamic params}) async {
    emit(ProductsDisplayLoading());
    var returnedData = await usecase.call(params: params);
    returnedData.fold((error) {
      emit(ProductsDisplayFailure(error));
    }, (data) {
      emit(ProductsDisplayLoaded(data));
    });
  }

  void displayInit() {
    emit(ProductsDisplayInit());
  }
}
