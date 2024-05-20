// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppearanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppearancePage(),
      );
    },
    CommonSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CommonSettingsScreen(),
      );
    },
    ConfigRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfigPage(),
      );
    },
    CurrencyRoute.name: (routeData) {
      final args = routeData.argsAs<CurrencyRouteArgs>(
          orElse: () => const CurrencyRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CurrencyPage(key: args.key),
      );
    },
    ExcursionInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ExcursionInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExcursionInfoPage(
          key: args.key,
          excursion: args.excursion,
          refresh: args.refresh,
        ),
      );
    },
    ExcursionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExcursionPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LicenseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LicensePage(),
      );
    },
    LoadingRoute.name: (routeData) {
      final args = routeData.argsAs<LoadingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoadingPage(
          key: args.key,
          loadingText: args.loadingText,
          backGround: args.backGround,
        ),
      );
    },
    MainLayoutSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainLayoutSettingsScreen(),
      );
    },
    PlacesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlacesPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    WeatherRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherRouteArgs>(
          orElse: () => const WeatherRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WeatherPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [AppearancePage]
class AppearanceRoute extends PageRouteInfo<void> {
  const AppearanceRoute({List<PageRouteInfo>? children})
      : super(
          AppearanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppearanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CommonSettingsScreen]
class CommonSettingsRoute extends PageRouteInfo<void> {
  const CommonSettingsRoute({List<PageRouteInfo>? children})
      : super(
          CommonSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommonSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfigPage]
class ConfigRoute extends PageRouteInfo<void> {
  const ConfigRoute({List<PageRouteInfo>? children})
      : super(
          ConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfigRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CurrencyPage]
class CurrencyRoute extends PageRouteInfo<CurrencyRouteArgs> {
  CurrencyRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CurrencyRoute.name,
          args: CurrencyRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CurrencyRoute';

  static const PageInfo<CurrencyRouteArgs> page =
      PageInfo<CurrencyRouteArgs>(name);
}

class CurrencyRouteArgs {
  const CurrencyRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CurrencyRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ExcursionInfoPage]
class ExcursionInfoRoute extends PageRouteInfo<ExcursionInfoRouteArgs> {
  ExcursionInfoRoute({
    Key? key,
    required Excursion excursion,
    required dynamic Function(Excursion) refresh,
    List<PageRouteInfo>? children,
  }) : super(
          ExcursionInfoRoute.name,
          args: ExcursionInfoRouteArgs(
            key: key,
            excursion: excursion,
            refresh: refresh,
          ),
          initialChildren: children,
        );

  static const String name = 'ExcursionInfoRoute';

  static const PageInfo<ExcursionInfoRouteArgs> page =
      PageInfo<ExcursionInfoRouteArgs>(name);
}

class ExcursionInfoRouteArgs {
  const ExcursionInfoRouteArgs({
    this.key,
    required this.excursion,
    required this.refresh,
  });

  final Key? key;

  final Excursion excursion;

  final dynamic Function(Excursion) refresh;

  @override
  String toString() {
    return 'ExcursionInfoRouteArgs{key: $key, excursion: $excursion, refresh: $refresh}';
  }
}

/// generated route for
/// [ExcursionPage]
class ExcursionRoute extends PageRouteInfo<void> {
  const ExcursionRoute({List<PageRouteInfo>? children})
      : super(
          ExcursionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExcursionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LicensePage]
class LicenseRoute extends PageRouteInfo<void> {
  const LicenseRoute({List<PageRouteInfo>? children})
      : super(
          LicenseRoute.name,
          initialChildren: children,
        );

  static const String name = 'LicenseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<LoadingRouteArgs> {
  LoadingRoute({
    Key? key,
    required String loadingText,
    Color? backGround,
    List<PageRouteInfo>? children,
  }) : super(
          LoadingRoute.name,
          args: LoadingRouteArgs(
            key: key,
            loadingText: loadingText,
            backGround: backGround,
          ),
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<LoadingRouteArgs> page =
      PageInfo<LoadingRouteArgs>(name);
}

class LoadingRouteArgs {
  const LoadingRouteArgs({
    this.key,
    required this.loadingText,
    this.backGround,
  });

  final Key? key;

  final String loadingText;

  final Color? backGround;

  @override
  String toString() {
    return 'LoadingRouteArgs{key: $key, loadingText: $loadingText, backGround: $backGround}';
  }
}

/// generated route for
/// [MainLayoutSettingsScreen]
class MainLayoutSettingsRoute extends PageRouteInfo<void> {
  const MainLayoutSettingsRoute({List<PageRouteInfo>? children})
      : super(
          MainLayoutSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainLayoutSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlacesPage]
class PlacesRoute extends PageRouteInfo<void> {
  const PlacesRoute({List<PageRouteInfo>? children})
      : super(
          PlacesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlacesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeatherPage]
class WeatherRoute extends PageRouteInfo<WeatherRouteArgs> {
  WeatherRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WeatherRoute.name,
          args: WeatherRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static const PageInfo<WeatherRouteArgs> page =
      PageInfo<WeatherRouteArgs>(name);
}

class WeatherRouteArgs {
  const WeatherRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'WeatherRouteArgs{key: $key}';
  }
}
