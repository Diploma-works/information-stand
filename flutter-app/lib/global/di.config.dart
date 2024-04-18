// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i24;
import 'package:flutter/services.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:information_stand/app/routes/app_router.dart' as _i3;
import 'package:information_stand/features/currency/services/currency_service/currency_service/currency_service.dart'
    as _i34;
import 'package:information_stand/features/currency/services/currency_service/currency_service_interface.dart'
    as _i33;
import 'package:information_stand/features/excursion/presentation/excursion_info_page/services/excursion_info_service/excursion_info_service/excursion_info_service.dart'
    as _i26;
import 'package:information_stand/features/excursion/presentation/excursion_info_page/services/excursion_info_service/excursion_info_service_interface.dart'
    as _i25;
import 'package:information_stand/features/excursion/services/excursion_service/excursion_service/excursion_service.dart'
    as _i28;
import 'package:information_stand/features/excursion/services/excursion_service/excursion_service_interface.dart'
    as _i27;
import 'package:information_stand/features/license/services/license_service/license_service/license_service.dart'
    as _i30;
import 'package:information_stand/features/license/services/license_service/license_service_interface.dart'
    as _i29;
import 'package:information_stand/features/settings/config/services/config_service.dart'
    as _i22;
import 'package:information_stand/features/settings/config/services/config_storage/config_storage.dart'
    as _i12;
import 'package:information_stand/features/settings/config/services/main_config_service/main_config_service.dart'
    as _i23;
import 'package:information_stand/features/weather/services/weather_service/weather_service/weather_service.dart'
    as _i32;
import 'package:information_stand/features/weather/services/weather_service/weather_service_interface.dart'
    as _i31;
import 'package:information_stand/global/di.dart' as _i35;
import 'package:information_stand/services/file_service/app_file_service/app_file_service.dart'
    as _i21;
import 'package:information_stand/services/file_service/file_service.dart'
    as _i13;
import 'package:information_stand/services/file_service/qbic_file_service/qbic_file_service.dart'
    as _i14;
import 'package:information_stand/services/log_service/console_log/console_log.dart'
    as _i16;
import 'package:information_stand/services/log_service/log.dart' as _i15;
import 'package:information_stand/services/storage/file_storage/file_storage.dart'
    as _i19;
import 'package:information_stand/services/storage/shared_pref_storage/shared_pref_storage.dart'
    as _i9;
import 'package:information_stand/services/storage/storage.dart' as _i8;
import 'package:information_stand/ui/services/color_storage/color_storage.dart'
    as _i10;
import 'package:information_stand/ui/services/color_storage/color_storage_impl/color_storage_impl.dart'
    as _i11;
import 'package:information_stand/ui/services/main_layout_storage/main_layout_storage.dart'
    as _i17;
import 'package:information_stand/ui/services/main_layout_storage/main_layout_storage_impl/color_storage_impl.dart'
    as _i18;
import 'package:information_stand/ui/services/ui_service.dart' as _i20;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart'
    as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.AppRouter>(appModule.appRouter());
    gh.singleton<_i4.Logger>(appModule.logger());
    gh.singleton<_i5.MethodChannel>(appModule.setChannel());
    gh.singleton<_i6.PathProviderPlatform>(appModule.sharedPrefMockStorage());
    gh.singletonAsync<_i7.SharedPreferences>(
        () => appModule.sharedPrefStorage());
    gh.singletonAsync<_i8.Storage>(
      () async =>
          _i9.SharedPrefStorage(await getAsync<_i7.SharedPreferences>()),
      instanceName: 'sharedPrefStorage',
    );
    gh.singletonAsync<_i10.ColorStorage>(() async => _i11.ColorKitStorageImpl(
        await getAsync<_i8.Storage>(instanceName: 'sharedPrefStorage')));
    gh.singletonAsync<_i12.ConfigStorage>(() async => _i12.ConfigStorage(
        await getAsync<_i8.Storage>(instanceName: 'sharedPrefStorage')));
    gh.lazySingleton<_i13.FileService>(
        () => _i14.QbicFileService(gh<_i6.PathProviderPlatform>()));
    gh.singleton<_i15.Log>(
      _i16.ConsoleLog(gh<_i4.Logger>()),
      instanceName: 'console',
    );
    gh.singletonAsync<_i17.MainLayoutStorage>(() async =>
        _i18.MainLayoutStorageImpl(
            await getAsync<_i8.Storage>(instanceName: 'sharedPrefStorage')));
    gh.singleton<_i8.Storage>(appModule.storage(gh<_i13.FileService>()));
    gh.singleton<_i8.Storage>(
      _i19.FileStorage(gh<_i13.FileService>()),
      instanceName: 'fileStorage',
    );
    gh.singletonAsync<_i20.UiService>(() async => _i20.UiService(
          await getAsync<_i10.ColorStorage>(),
          await getAsync<_i17.MainLayoutStorage>(),
        ));
    gh.singleton<_i21.AppFileService>(
        _i21.AppFileService(gh<_i13.FileService>()));
    gh.singletonAsync<_i22.ConfigService>(() async =>
        _i23.MainConfigService(await getAsync<_i12.ConfigStorage>()));
    gh.factory<_i24.Dio>(
      () => appModule.weatherClient(gh<_i15.Log>(instanceName: 'console')),
      instanceName: 'weatherClient',
    );
    gh.factory<_i24.Dio>(
      () => appModule.currencyClient(gh<_i15.Log>(instanceName: 'console')),
      instanceName: 'currencyClient',
    );
    gh.factory<_i24.Dio>(
      () => appModule.excursionClient(gh<_i15.Log>(instanceName: 'console')),
      instanceName: 'excursionClient',
    );
    gh.factory<_i24.Dio>(
      () =>
          appModule.excursionInfoClient(gh<_i15.Log>(instanceName: 'console')),
      instanceName: 'excursionInfoClient',
    );
    gh.factory<_i24.Dio>(
      () => appModule.licenseClient(gh<_i15.Log>(instanceName: 'console')),
      instanceName: 'licenseClient',
    );
    gh.singleton<_i25.ExcursionInfoServiceInterface>(_i26.ExcursionService(
        gh<_i24.Dio>(instanceName: 'excursionInfoClient')));
    gh.singleton<_i27.ExcursionServiceInterface>(
        _i28.ExcursionService(gh<_i24.Dio>(instanceName: 'excursionClient')));
    gh.singleton<_i29.LicenseServiceInterface>(
        _i30.LicenseService(gh<_i24.Dio>(instanceName: 'licenseClient')));
    gh.singleton<_i31.WeatherServiceInterface>(
        _i32.WeatherService(gh<_i24.Dio>(instanceName: 'weatherClient')));
    gh.singleton<_i33.CurrencyServiceInterface>(
        _i34.CurrencyService(gh<_i24.Dio>(instanceName: 'currencyClient')));
    return this;
  }
}

class _$AppModule extends _i35.AppModule {}
