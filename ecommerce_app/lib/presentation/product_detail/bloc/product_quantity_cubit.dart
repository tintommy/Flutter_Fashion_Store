import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ProductQuantityCubit extends Cubit<int> {
  ProductQuantityCubit() : super(1);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state != 1) emit(state - 1);
  }
}
