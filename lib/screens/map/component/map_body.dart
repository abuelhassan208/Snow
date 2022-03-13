import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snow_ar/screens/map/bloc/cubit/cubit.dart';
import 'package:snow_ar/screens/map/bloc/state_s/states.dart';
import 'google_map_view.dart';

class MapBody extends StatelessWidget {
  const MapBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: GoogleMapView()),
        BlocBuilder<MapCubit, MapStates>(
          builder: (context, state) {
            MapCubit cubit = MapCubit.of(context);
              return SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: double.infinity,
                child: cubit.showButton
                    ? Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Theme.of(context).canvasColor, width: 2),
                          ),
                          child: MaterialButton(
                            elevation: 10,
                            onPressed: () {
                              cubit.getWeatherButton(context);
                            },
                            child: Text(
                              'Get Weather',
                              style: TextStyle(
                                color: Theme.of(context).canvasColor,
                                fontSize: 25,
                                fontFamily: 'Quintessential',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              );
            }

        ),
      ],
    );
  }
}
