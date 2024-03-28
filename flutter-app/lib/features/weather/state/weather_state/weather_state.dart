import 'dart:async';
import 'package:flutter/material.dart';
import 'package:information_stand/features/weather/models/weather/weather_response.dart';
import 'package:information_stand/features/weather/services/weather_service/weather_service_interface.dart';
import 'package:logger/logger.dart';

class WeatherState with ChangeNotifier {
  WeatherServiceInterface weatherService;
  Logger log;
  WeatherResponse? _weatherData;

  WeatherState(this.weatherService, this.log);

  WeatherResponse? get weatherData => _weatherData;


  Future<void> getWeather() async {
    _weatherData = await weatherService.getWeather();
  }
}
