part of 'categories_display_cubit.dart';

@immutable
sealed class CategoriesDisplayState {}

final class CategoriesDisplayLoading extends CategoriesDisplayState {}
final class CategoriesDisplayLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;

  CategoriesDisplayLoaded(this.categories);
}
final class CategoriesDisplayFailure extends CategoriesDisplayState {
  String error;

  CategoriesDisplayFailure(this.error);
}
