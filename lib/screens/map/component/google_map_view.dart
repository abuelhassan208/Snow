import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snow_ar/constants/error/error.dart';
import 'package:snow_ar/screens/map/bloc/cubit/cubit.dart';
import 'package:snow_ar/screens/map/bloc/state_s/states.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapStates>(
      builder: (context, state) {
        MapCubit cubit = MapCubit.of(context);
        if (state is MapErrorState) {
          return const ErrorView();
        } else {
          return GoogleMap(
            mapType: MapType.normal,
            onTap: cubit.googleMapOnTap,
            onMapCreated: cubit.onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(cubit.getPosition(context)!.latitude,
                  cubit.getPosition(context)!.longitude),
              zoom: 12.5,
            ),
            markers: cubit.marker,
          );
        }
      },
    );
  }
}
