import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snow_ar/constants/loading_indicator/loading_indicator.dart';
import 'package:snow_ar/screens/home/bloc/cubit/cubit.dart';
import 'package:snow_ar/screens/home/bloc/state_s/states.dart';
import 'package:snow_ar/screens/home/widget_s/text_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.of(context);
        if (state is HomeLoadingState) {
          return const LoadingIndicator();
        } else if (state is HomeGetDataState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(text: 'Name', value: cubit.weather.name),
                TextView(text: 'Id', value: cubit.weather.id.toString()),
                TextView(
                    text: 'Time Zone',
                    value: cubit.weather.timezone.toString()),
                TextView(
                    text: 'Temp',
                    value: cubit.weather.main.temp.toString()),
                TextView(
                    text: 'Temp Max',
                    value: cubit.weather.main.tempMax.toString()),
                TextView(
                    text: 'Temp Min',
                    value: cubit.weather.main.tempMin.toString()),
                TextView(
                    text: 'Weather Icon ',
                    value: cubit.weather.weather[0].icon),
                TextView(
                    text: 'Weather Main ',
                    value: cubit.weather.weather[0].main),
                TextView(
                    text: 'Weather Id',
                    value: cubit.weather.weather[0].id.toString()),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
