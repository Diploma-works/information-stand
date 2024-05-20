import 'package:injectable/injectable.dart';

class WeatherConst {

  static const String baseUrl = 'http://192.168.1.101:8080';
  static const weatherClient = Named('weatherClient');
}
