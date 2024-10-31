import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:meta/meta.dart';

part 'ages_display_state.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  Future<void> displayAges() async {
    var returnedData = await getIt<GetAgesUsecase>().call();
    returnedData.fold(
            (leftValue) {
      emit(AgesFailure(leftValue));
    },
            (rightValue) {
      emit(AgesLoaded(rightValue));
    });
  }
}
