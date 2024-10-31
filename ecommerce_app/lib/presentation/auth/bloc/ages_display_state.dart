part of 'ages_display_cubit.dart';

@immutable
sealed class AgesDisplayState {}

final class AgesLoading extends AgesDisplayState {}
final class AgesLoaded extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String,dynamic>>> ages;

  AgesLoaded(this.ages);
}
final class AgesFailure extends AgesDisplayState {
  final String messenger;

  AgesFailure(this.messenger);
}