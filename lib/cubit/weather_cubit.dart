import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this.weatherServices,
  ) : super(GetWeatherinitial());
  final WeatherServices weatherServices;
  String ?cityName;
  WeatherModel? weatherModel;
  void getWeather(String nameCity) async {
    emit(GetWeatherloading());
    try {
      weatherModel = await weatherServices.get(nameCity: nameCity);
      emit(GetWeatherSucsses());
    } on Exception catch (e) {
      emit(GetWeatherFaliure(errMess: '$e'));
    }
  }
}
