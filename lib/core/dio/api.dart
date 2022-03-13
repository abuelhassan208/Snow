import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snow_ar/models/weather.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<WeatherModel> getData(
      {required String url, required Map<String, dynamic> query}) async {
    try {
      var response = await dio!.get(
        url,
        queryParameters: query,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      return WeatherModel.fromJson(response.data);
    } on DioError catch (error, path) {
      debugPrint(error.message);
      debugPrint('====================>$path');
    }
    throw Exception('Dio Has Error');
  }
}
