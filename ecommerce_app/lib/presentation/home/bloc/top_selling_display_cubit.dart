import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/domain/product/usecases/get_top_selling.dart';
import 'package:meta/meta.dart';

import '../../../service_locator.dart';

part 'top_selling_display_state.dart';

class TopSellingDisplayCubit extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(TopSellingDisplayLoading());

  void displayTopSelling() async{
    var returnedData= await getIt<GetTopSellingUseCase>().call();
    returnedData.fold((error){
      emit(TopSellingDisplayFailure(error));

    }, (data){
      emit(TopSellingDisplayLoaded(data));
    });
  }
}
