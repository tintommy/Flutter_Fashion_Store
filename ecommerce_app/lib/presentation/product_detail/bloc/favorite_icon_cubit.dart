import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/domain/product/usecases/add_or_remove_favorite.dart';
import 'package:ecommerce_app/domain/product/usecases/is_favorite.dart';
import 'package:meta/meta.dart';

import '../../../service_locator.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  void isFavorite(String productId) async {
    var result = await getIt<IsFavoriteUseCase>().call(params: productId);
    emit(result);
  }

  void onTap(ProductEntity product) async {
    var result =
        await getIt<AddOrRemoveFavoriteUseCase>().call(params: product);
    result.fold((error) {
      emit(error);
    }, (data) {
      emit(data);
    });
  }
}
