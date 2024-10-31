part of 'get_new_in_display_cubit.dart';

@immutable
sealed class GetNewInDisplayState {}

final class GetNewInDisplayLoading extends GetNewInDisplayState {}

final class GetNewInDisplayLoaded extends GetNewInDisplayState {
  List<ProductEntity> products;

  GetNewInDisplayLoaded(this.products);
}

final class GetNewInDisplayFailure extends GetNewInDisplayState {
  String error;

  GetNewInDisplayFailure(this.error);
}
