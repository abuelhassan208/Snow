import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snow_ar/constants/error/error.dart';
import 'package:snow_ar/screens/home/bloc/cubit/cubit.dart';
import 'package:snow_ar/screens/home/bloc/state_s/states.dart';

import 'component/home_app_bar.dart';
import 'component/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..isConnected()..getWeather(context),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeErrorState) {
            return const ErrorView();
          } else {
            return Scaffold(
              appBar: homeAppBAr(context),
              body: const HomeBody(),
            );
          }
        },
      ),
    );
  }
}
