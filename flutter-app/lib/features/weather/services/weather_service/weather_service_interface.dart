import 'package:information_stand/features/weather/models/weather/weather_response.dart';

abstract interface class WeatherServiceInterface {

  Future<WeatherResponse?> getWeather();

}