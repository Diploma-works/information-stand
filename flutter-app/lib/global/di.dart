import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:information_stand/app/routes/app_router.dart';
import 'package:information_stand/features/currency/services/clients/currency_client.dart';
import 'package:information_stand/features/excursion/presentation/excursion_info_page/services/client/excursion_client.dart';
import 'package:information_stand/features/excursion/services/client/excursion_client.dart';
import 'package:information_stand/features/license/services/clients/license_client.dart';
import 'package:information_stand/features/weather/services/clients/weather_client.dart';
import 'package:information_stand/global/global.dart';
import 'package:information_stand/services/file_service/file_service.dart';
import 'package:information_stand/services/log_service/log.dart';
import 'package:information_stand/services/storage/file_storage/file_storage.dart';
import 'package:information_stand/services/storage/storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'di.config.dart';
import '../services/log_service/const/log_service_const.dart';
import 'package:information_stand/features/license/const/license_const.dart';
import 'package:information_stand/features/excursion/const/excursion_const.dart';
import 'package:information_stand/features/weather/const/weather_const.dart';
import 'package:information_stand/features/currency/const/currency_const.dart';
import 'package:information_stand/features/excursion/presentation/excursion_info_page/const/excursion_info_const.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  setUpSystemUIOverlay();

  getIt.init();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    //todo add: своя реализация обработчика
  };

  await getIt.allReady();
}

void setUpSystemUIOverlay() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

@module
abstract class AppModule {
  @singleton
  Logger logger() => Logger();

  @LicenseConst.licenseClient
  Dio licenseClient(@LogServiceConst.console Log log) =>
      createLicenseClient(log);

  @WeatherConst.weatherClient
  Dio weatherClient(@LogServiceConst.console Log log) =>
      createWeatherClient(log);

  @CurrencyConst.currencyClient
  Dio currencyClient(@LogServiceConst.console Log log) =>
      createCurrencyClient(log);

  @ExcursionConst.excursionClient
  Dio excursionClient(@LogServiceConst.console Log log) =>
      createExcursionClient(log);

  @ExcursionInfoConst.excursionInfoClient
  Dio excursionInfoClient(@LogServiceConst.console Log log) =>
      createExcursionInfoClient(log);

  @singleton
  Future<SharedPreferences> sharedPrefStorage() async =>
      await SharedPreferences.getInstance();

  @singleton
  AppRouter appRouter() => AppRouter(navigatorKey);

  @singleton
  Storage storage(FileService fileService) => FileStorage(fileService);

  @singleton
  MethodChannel setChannel() =>
      const MethodChannel('com.example.information_stand');

  @singleton
  PathProviderPlatform sharedPrefMockStorage() => PathProviderPlatform.instance;
}
