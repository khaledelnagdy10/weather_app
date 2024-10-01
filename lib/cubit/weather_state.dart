abstract class WeatherState {}
class GetWeatherinitial implements WeatherState {}

class GetWeatherSucsses implements WeatherState {}

class GetWeatherloading implements WeatherState {}

class GetWeatherFaliure implements WeatherState {
  final String errMess;

  GetWeatherFaliure({required this.errMess});
}
