import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';

class WeatherView extends StatefulWidget {
  WeatherView({
    super.key,
  });

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    BlocProvider.of<WeatherCubit>(context);
    super.initState();
  }

  String? nameCity;

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${weatherModel?.nameCity}'),
            Text(DateTime.now().toString()),
            Row(
              children: [
                Image.asset('assets/images/rainy.png'),
                const Spacer(
                  flex: 1,
                ),
                Text(BlocProvider.of<WeatherCubit>(context).cityName!),
                const Spacer(
                  flex: 1,
                ),
                Column(
                  children: [
                    Text('${weatherModel?.maxTemp}'),
                    Text('${weatherModel?.minTemp}'),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            Text(
              'Rainy',
              style: TextStyle(color: Colors.black, fontSize: 29),
            )
          ],
        ),
      ),
    );
  }
}
