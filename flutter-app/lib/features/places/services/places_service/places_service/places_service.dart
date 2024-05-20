import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:information_stand/features/places/models/place.dart';
import 'package:information_stand/features/places/services/places_service/places_service_interface.dart';
import 'package:injectable/injectable.dart';
import '../../../const/places_const.dart';

@Singleton(as: PlacesServiceInterface)
class PlacesService implements PlacesServiceInterface {
  final Dio _client;

  PlacesService(@PlacesConst.placesClient this._client);

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
  Future<List<Place?>> getPlaces() async {
    try {
      final imei = await _getId();
      final response = await _client.get(
        '/catalog/places',
        options: Options(
          headers: {
            'Device-Code': imei,
          },
        ),
      );
      List<Place> result = [];
      if (response.statusCode == 200) {
        for (final obj in response.data) {
          result.add(Place.fromJson(obj));
        }
        return result;
      } else {
        return result;
      }
    } on DioException catch (exception, stackTrace) {
      rethrow;
    }
  }


}
