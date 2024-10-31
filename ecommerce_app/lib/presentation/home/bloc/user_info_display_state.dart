part of 'user_info_display_cubit.dart';

@immutable
sealed class UserInfoDisplayState {}

final class UserInfoLoading extends UserInfoDisplayState {}

final class UserInfoLoaded extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoLoaded(this.user);
}

final class UserInfoFailure extends UserInfoDisplayState {
  final String error;

  UserInfoFailure(this.error);
}
