import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/views/weather_view.dart';

import 'package:weather_app/widgets/custom_text_field.dart';

class SearchView extends StatelessWidget {
  SearchView({
    super.key,
  });
  String? nameCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: CustomTextField(
              onSubmitted: (value) {
                nameCity = value;
                BlocProvider.of<WeatherCubit>(context).getWeather(nameCity!);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WeatherView();
                }));
                log('$nameCity');
              },
            )),
      ),
    );
  }
}
