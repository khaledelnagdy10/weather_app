
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  WeatherServices({required this.dio});
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b55c0d8a77ca424e91b172817240404';
  Future<WeatherModel> get({required String nameCity}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$nameCity&days=1&aqi=no&alerts=no');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      throw e;
    }
  }
}
