import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:information_stand/features/license/services/license_service/license_service_interface.dart';
import 'package:injectable/injectable.dart';
import '/features/license/const/license_const.dart';
import '../exceptions/license_exception.dart';

@Singleton(as: LicenseServiceInterface)
class LicenseService implements LicenseServiceInterface {
  final Dio _client;

  LicenseService(@LicenseConst.licenseClient this._client);

  @override
  Future<bool> get license async => await check();

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
  Future<bool> check() async {
    try {
      final imei = await _getId();
      final response = await _client.get(
        '/imei/check',
        options: Options(
          headers: {
            'Device-Code': imei,
          },
        ),
      );

      return response.data;
    } on DioException catch (exception, stackTrace) {
      final error = _errorHandler(exception, stackTrace);
      if (error != null) {
        throw error;
      } else {
        rethrow;
      }
    }
  }

  Exception? _errorHandler(DioException exception, StackTrace stackTrace) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        {
          final Response? response = exception.response;

          if (response != null) {
            final message = response.data;
            switch (response.statusCode) {
              case 400 || 401 || 403 || 404:
                {
                  return LicenseException(message['message'],
                      exception: exception, stackTrace: stackTrace);
                }
            }
          }
        }
      case DioExceptionType.unknown:
        {
          //todo: Обработка случая: Без интернета (проверить срок последний проверки ключа)
        }

      default:
        {
          return null;
        }
    }
    return null;
  }
}
