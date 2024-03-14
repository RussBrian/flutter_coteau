// ignore_for_file: depend_on_referenced_packages

import 'package:weather/weather.dart';

class WeatherService {
  final WeatherFactory _weatherFactory =
      WeatherFactory("92050666fb7c936344f82c3d15a53b36");
  final double _lat = 18.4861;
  final double _lon = -69.9312;

  Future<Weather> getCurrentWeather() async {
    try {
      return await _weatherFactory.currentWeatherByLocation(_lat, _lon);
    } catch (e) {
      throw Exception('Error obteniendo la data del clima: $e');
    }
  }
}
