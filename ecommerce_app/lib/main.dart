import 'package:ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_app/presentation/splash/pages/splash.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/configs/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initiallizeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
          themeMode: ThemeMode.dark,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: SafeArea(child: SplashPage())),
    );
  }
}