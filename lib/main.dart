import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';

import 'views/no_weather_view.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => WeatherCubit(WeatherServices(dio: Dio())),
   
  child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NoWeatherView(),
    );
  }
}
