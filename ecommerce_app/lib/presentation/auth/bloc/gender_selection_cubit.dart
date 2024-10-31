import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(1);
  int selectedIndex = 1;

  void selectGender(int index) {
    selectedIndex = index;
    emit(selectedIndex);
  }
}
