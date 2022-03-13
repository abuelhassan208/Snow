import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:snow_ar/screens/splash/view.dart';
import 'core/bloc_observer.dart';
import 'core/dio/api.dart';
import 'core/theme/theme.dart';

void main() {
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CoreTheme.appTheme(),
      debugShowCheckedModeBanner: false,
      home:  const SplashView(),
    );
  }
}
