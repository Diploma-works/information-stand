import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:information_stand/features/currency/models/currency_rates.dart';
import 'package:information_stand/features/currency/services/currency_service/currency_service_interface.dart';
import '../../../const/currency_const.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CurrencyServiceInterface)
class CurrencyService implements CurrencyServiceInterface {
  final Dio _client;

  CurrencyService(@CurrencyConst.currencyClient this._client);

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
  Future<CurrencyRates?> getCurrency() async {
    try {
      final imei = await _getId();
      final response = await _client.get(
        '/weather_currency/currency',
        options: Options(
          headers: {
            'Device-Code': imei,
          },
        ),
      );
      if (response.statusCode == 200) {
        return CurrencyRates.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (exception, stackTrace) {
      rethrow;
    }
  }
}
