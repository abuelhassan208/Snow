import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:snow_ar/core/connectivity/connectivity.dart';
import 'package:snow_ar/core/geolocator/geolocator.dart';
import 'package:snow_ar/core/navigation/core_nav.dart';
import 'package:snow_ar/screens/map/view.dart';
import '../states/states.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitState());

  static SplashCubit of(context) => BlocProvider.of(context);

  Position? position;

  void isConnected() => checkConnectivity(
    error: () {
      emit(SplashErrorState());
    },
    connect: () {
      emit(SplashInitState());
    },
  );

  void getLocation(context) async{
    bool connected = await Connectivity().checkConnectivity() != ConnectivityResult.none;
    if(connected){
      try {
        Timer(
          const Duration(seconds: 15),
              () async {
            position = await determinePosition();
            Timer(
              const Duration(seconds: 5),
                  () {
                CoreNav.pushReplacement(
                  context,
                  BlocProvider<SplashCubit>.value(
                    child: const MapView(),
                    value: SplashCubit.of(context),
                  ),
                );
              },
            );
          },
        );
      } catch (error, path) {
        debugPrint("==============>$error");
        emit(SplashErrorState());
        debugPrint("==============>$path..");
      }
    }else{
      emit(SplashErrorState());
    }

  }


  @override
  Future<void> close() {

    return super.close();
  }
}
