import 'package:ecommerce_app/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 3));
    var isLoggedIn = await getIt<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else
      emit(UnAuthenticated());
  }
}
