import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snow_ar/constants/error/error.dart';
import 'package:snow_ar/screens/splash/bloc/states/states.dart';
import 'bloc/cubit/cubit.dart';
import 'component/splash_app_bar.dart';
import 'component/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..isConnected(),
      child: BlocConsumer<SplashCubit, SplashStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SplashErrorState) {
            return const ErrorView();
          } else {
            SplashCubit.of(context).getLocation(context);
            return Scaffold(
              appBar: splashAppBar(context),
              body: const SplashBody(),
            );
          }
        },
      ),
    );
  }
}
