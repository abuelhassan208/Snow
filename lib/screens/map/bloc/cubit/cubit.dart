import 'dart:collection';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snow_ar/core/connectivity/connectivity.dart';
import 'package:snow_ar/core/navigation/core_nav.dart';
import 'package:snow_ar/screens/home/bloc/state_s/states.dart';
import 'package:snow_ar/screens/home/view.dart';
import 'package:snow_ar/screens/splash/bloc/cubit/cubit.dart';
import '../state_s/states.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapInitState());

  //================================================//
  late LatLng positionToHome;
  Position? position;

  static MapCubit of(context) => BlocProvider.of(context);
  bool showButton = false;
  late GoogleMapController mapController;
  var marker = HashSet<Marker>();

//==================================================//
   void isConnected() => checkConnectivity(
    error: () {
      emit(MapErrorState());
    },
    connect: () {
      emit(MapInitState());
    },
  );

  Position? getPosition(context) => SplashCubit.of(context).position;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void markerController({required latitude, required longitude}) {
    marker.add(
      Marker(
        markerId: const MarkerId('0'),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
          title: "Check",
          onTap: () {
            showButton = true;
            emit(ButtonGetWeatherState());
          },
        ),
      ),
    );
  }

  void googleMapOnTap(LatLng value) {
    marker.clear();
    debugPrint(value.latitude.toString());
    markerController(latitude: value.latitude, longitude: value.longitude);
    emit(MapMarkerCreatedState());
    positionToHome = value;
  }

  void getWeatherButton(context) {
    CoreNav.push(
      context,
      BlocProvider<MapCubit>.value(
        value: MapCubit.of(context),
        child: const HomeView(),
      ),
    );
  }
}
