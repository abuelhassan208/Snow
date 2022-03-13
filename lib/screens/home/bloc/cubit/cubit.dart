import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snow_ar/core/connectivity/connectivity.dart';
import 'package:snow_ar/core/dio/api.dart';
import 'package:snow_ar/models/weather.dart';
import 'package:snow_ar/screens/home/bloc/state_s/states.dart';
import 'package:snow_ar/screens/map/bloc/cubit/cubit.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit of(context) => BlocProvider.of(context);

  late WeatherModel weather;

  void isConnected() => checkConnectivity(
        error: () {
          emit(HomeErrorState());
        },
        connect: () {
          emit(HomeInitState());
        },
      );

  getWeather(context) async {
    bool connected =
        await Connectivity().checkConnectivity() != ConnectivityResult.none;
    if (connected) {
      emit(HomeLoadingState());
      try {
        Map<String, dynamic> query = {
          'lat': '${MapCubit.of(context).positionToHome.latitude}',
          'lon': '${MapCubit.of(context).positionToHome.longitude}',
          'appid': 'ec9800d9b45d9126ddfc550cbb392abf'
        };
        String url = 'data/2.5/weather?';
        await DioHelper.getData(
          url: url,
          query: query,
        ).then((value) {
          weather = value;
          emit(HomeGetDataState());
        }).catchError((e, p) {
          debugPrint('=====================> $e');
          emit(HomeErrorState());
          debugPrint('=====================> $p');
        });
      } catch (e, p) {
        debugPrint('=====================> $e');
        emit(HomeErrorState());
        debugPrint('=====================> $p');
      }
    } else {
      emit(HomeErrorState());
    }
  }
}
