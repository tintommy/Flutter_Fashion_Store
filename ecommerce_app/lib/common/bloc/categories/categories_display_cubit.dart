import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/category/entity/category.dart';
import 'package:ecommerce_app/domain/category/usecase/get_categories.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:meta/meta.dart';

part 'categories_display_state.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesDisplayLoading());

  void displayCategories() async {
    var returnedData = await getIt<GetCategoriesUseCase>().call();
    returnedData.fold((error) {
      emit(CategoriesDisplayFailure(error));
    }, (data) {
      print("loaded");
      emit(CategoriesDisplayLoaded(data));
    });
  }
}
