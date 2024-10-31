part of 'top_selling_display_cubit.dart';

@immutable
sealed class TopSellingDisplayState {}

final class TopSellingDisplayLoading extends TopSellingDisplayState {}
final class TopSellingDisplayLoaded extends TopSellingDisplayState {
  List<ProductEntity> products;

  TopSellingDisplayLoaded(this.products);
}
final class TopSellingDisplayFailure extends TopSellingDisplayState {
  String error;

  TopSellingDisplayFailure(this.error);
}
