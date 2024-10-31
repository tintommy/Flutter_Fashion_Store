import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/auth/entity/user.dart';
import 'package:ecommerce_app/domain/auth/usecases/get_user.dart';
import 'package:meta/meta.dart';

import '../../../service_locator.dart';

part 'user_info_display_state.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());
  
  void displayUserInfo() async{
    var returnedData= await getIt<GetUserUsecase>().call();
    returnedData.fold((error){
      emit(UserInfoFailure(error));
      
    }, (data){
      emit(UserInfoLoaded(data));
    });
  }
}
