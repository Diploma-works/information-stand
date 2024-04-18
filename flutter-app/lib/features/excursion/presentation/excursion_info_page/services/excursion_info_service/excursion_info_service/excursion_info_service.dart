import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:information_stand/features/excursion/models/excursion.dart';
import 'package:information_stand/features/excursion/presentation/excursion_info_page/services/excursion_info_service/excursion_info_service_interface.dart';
import 'package:injectable/injectable.dart';
import '../../../const/excursion_info_const.dart';

@Singleton(as: ExcursionInfoServiceInterface)
class ExcursionService implements ExcursionInfoServiceInterface {
  final Dio _client;

  ExcursionService(@ExcursionInfoConst.excursionInfoClient this._client);

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
        print(response.data);
        return Excursion.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (exception, stackTrace) {
      rethrow;
    }
  }
}
