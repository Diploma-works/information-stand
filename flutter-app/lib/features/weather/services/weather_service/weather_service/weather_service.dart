import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:information_stand/features/weather/models/weather/weather_model.dart';
import 'package:information_stand/features/weather/models/weather/weather_response.dart';
import 'package:information_stand/features/weather/services/weather_service/weather_service_interface.dart';
import 'package:injectable/injectable.dart';
import '/features/weather/const/weather_const.dart';

@Singleton(as: WeatherServiceInterface)
class WeatherService implements WeatherServiceInterface {
  final Dio _client;

  WeatherService(@WeatherConst.weatherClient this._client);

  Future<String?> _getCurrentCity() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      return placemarks.first.locality;
    } catch (e) {
      print('Error getting current city: $e');
    }
    return null;
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
  }

  @override
  Future<WeatherResponse?> getWeather() async {
    try {
      final city = await _getCurrentCity();
      final imei = await _getId();
      final response = await _client.get(
        '/weather_currency/weather',
        queryParameters: {"city": city},
        options: Options(
          headers: {
            'Device-Code': imei,
          },
        ),
      );
      if (response.statusCode == 200) {
        return WeatherResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (exception, stackTrace) {
      rethrow;
    }
  }
}
