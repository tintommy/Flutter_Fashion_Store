import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/domain/product/usecases/get_new_in.dart';
import 'package:meta/meta.dart';

import '../../../service_locator.dart';

part 'get_new_in_display_state.dart';

class GetNewInDisplayCubit extends Cubit<GetNewInDisplayState> {
  GetNewInDisplayCubit() : super(GetNewInDisplayLoading());

  void displayNewIn() async{
    var returnedData= await getIt<GetNewInUseCase>().call();
    returnedData.fold((error){
      emit(GetNewInDisplayFailure(error));

    }, (data){
      emit(GetNewInDisplayLoaded(data));
    });
  }
}
