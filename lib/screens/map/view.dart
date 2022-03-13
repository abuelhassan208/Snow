import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snow_ar/constants/error/error.dart';
import 'package:snow_ar/screens/map/bloc/cubit/cubit.dart';
import 'package:snow_ar/screens/map/bloc/state_s/states.dart';
import 'component/map_app_bar.dart';
import 'component/map_body.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit()..isConnected(),
      child: BlocConsumer<MapCubit, MapStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MapErrorState) {
            return const ErrorView();
          } else {
            return Scaffold(
              appBar: mapAppBar(),
              body: const MapBody(),
            );
          }
        },
      ),
    );
  }
}
