import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/views/search_view.dart';

import 'weather_view.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is GetWeatherloading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetWeatherSucsses) {
            return WeatherView(
                weatherModel:
                    BlocProvider.of<WeatherCubit>(context).weatherModel!);
          } else if (state is GetWeatherFaliure) {
            const Text('errrorrr');
          }
          return const Center(
            child: Text(
              'there is no weather ........Start Searching now',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
