import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    BlocProvider.of<WeatherCubit>(context);
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (!mounted) {
      super.setState(fn);
    }
  }

  String? nameCity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${widget.weatherModel.nameCity}'),
          Text(DateTime.now().toString()),
          Row(
            children: [
              Image.asset('assets/images/rainy.png'),
              const Spacer(
                flex: 1,
              ),
              Text(BlocProvider.of<WeatherCubit>(context).cityName),
              const Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  Text('${widget.weatherModel.maxTemp}'),
                  Text('${widget.weatherModel.minTemp}'),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          Text(
            widget.weatherModel.weatherCondition,
            style: TextStyle(color: Colors.black, fontSize: 29),
          )
        ],
      ),
    );
  }
}
