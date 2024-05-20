import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:information_stand/app/routes/guards/ImeiGuard.dart';
import 'package:information_stand/app/routes/guards/assets_guard.dart';
import 'package:information_stand/features/currency/presentation/currency_page/currency_page.dart';
import 'package:information_stand/features/excursion/models/excursion.dart';
import 'package:information_stand/features/excursion/presentation/excursion_info_page/presentation/excursion_info_page.dart';
import 'package:information_stand/features/excursion/presentation/excursion_page.dart';
import 'package:information_stand/features/home/presentation/home_page/home_page.dart';
import 'package:information_stand/features/license/presentation/loading_page/loading_page.dart';
import 'package:information_stand/features/license/services/license_service/license_service_interface.dart';
import 'package:information_stand/features/places/presentation/places_page.dart';
import 'package:information_stand/features/settings/config/presentation/config_page/config_page.dart';
import 'package:information_stand/features/settings/config/presentation/config_page/pages/appearance_page/appearance_page.dart';
import 'package:information_stand/features/settings/config/presentation/config_page/pages/appearance_page/main_layout_settings/main_layout_settings_screen.dart';
import 'package:information_stand/features/settings/config/presentation/config_page/pages/common_settings/common_settings.dart';
import 'package:information_stand/features/settings/presentation/settings_page/settings_page.dart';
import 'package:information_stand/features/weather/presentation/weather_page/weather_page.dart';
import 'package:information_stand/global/di.dart';
import 'package:information_stand/services/file_service/file_service.dart';

import '../../features/license/presentation/license_page/license_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter(GlobalKey<NavigatorState> navigatorKey)
      : super(navigatorKey: navigatorKey);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          guards: [
            ImeiGuard(
              getIt<LicenseServiceInterface>(),
            ),
            AssetsGuard(
              getIt<FileService>(),
            )
          ],
        ),
        AutoRoute(
          page: LoadingRoute.page,
        ),
        AutoRoute(
          page: LicenseRoute.page,
        ),
        AutoRoute(
          page: SettingsRoute.page,
        ),
        AutoRoute(page: ConfigRoute.page, guards: [
          AssetsGuard(
            getIt<FileService>(),
          )
        ], children: [
          CustomRoute(
              page: CommonSettingsRoute.page,
              durationInMilliseconds: 0,
              reverseDurationInMilliseconds: 0),
          CustomRoute(
            page: AppearanceRoute.page,
            durationInMilliseconds: 0,
            reverseDurationInMilliseconds: 0,
          )
        ]),
        CustomRoute(
          page: MainLayoutSettingsRoute.page,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
        ),
        AutoRoute(
          page: WeatherRoute.page,
        ),
        AutoRoute(
          page: CurrencyRoute.page,
        ),
        AutoRoute(
          page: ExcursionRoute.page,
        ),
        AutoRoute(
          page: ExcursionInfoRoute.page,
        ),
        AutoRoute(
          page: PlacesRoute.page,
        ),
      ];
}
