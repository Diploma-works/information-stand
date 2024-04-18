import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:information_stand/features/excursion/models/excursion.dart';
import 'package:information_stand/features/excursion/services/excursion_service/excursion_service_interface.dart';
import 'package:injectable/injectable.dart';
import '../../../const/excursion_const.dart';

@Singleton(as: ExcursionServiceInterface)
class ExcursionService implements ExcursionServiceInterface {
  final Dio _client;

  ExcursionService(@ExcursionConst.excursionClient this._client);

  Future<String?> _getCurrentCity() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
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
    return null;
  }

  @override
  Future<List<Excursion>?> getExcursions() async {
    try {
      final city = await _getCurrentCity();
      final imei = await _getId();
      final response = await _client.get(
        '/excursion/all',
        queryParameters: {"city": city},
        options: Options(
          headers: {
            'Device-Code': imei,
          },
        ),
      );
      List<Excursion> result = [];
      if (response.statusCode == 200) {
        for (final obj in response.data) {
          result.add(Excursion.fromJson(obj));
        }
        return result;
      } else {
        return result;
      }
    } on DioException catch (exception, stackTrace) {
      rethrow;
    }
  }

  @override
  Future<Excursion?> reservation(
      int excursionId, String credentials, int count) async {
    try {
      final imei = await _getId();
      final response = await _client.post('/excursion/reserve',
          options: Options(
            headers: {
              'Device-Code': imei,
            },
          ),
          data: {
            "excursionId": excursionId,
            "credentials": credentials,
            "count": count
          });
      if (response.statusCode == 200) {
        return Excursion.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (exception, stackTrace) {
      rethrow;
    }
  }
}
