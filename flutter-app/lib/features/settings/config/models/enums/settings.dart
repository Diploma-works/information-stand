import 'package:auto_route/auto_route.dart';
import 'package:information_stand/app/routes/app_router.dart';

///  Перечисления настроек
///
enum Settings {
  commonSettings(name: 'Основные', route: CommonSettingsRoute()),
  appearance(
    name: 'Внешний вид',
    route: AppearanceRoute(),
  );

  final String name;
  final PageRouteInfo route;

  const Settings({required this.name, required this.route});

  static String getName(Settings setting) {
    return setting.name;
  }

  static PageRouteInfo getRoute(Settings setting) {
    return setting.route;
  }

  static String getNameByIndex(int index) {
    return getName(Settings.values.elementAt(index));
  }

  static PageRouteInfo getRouteByIndex(int index) {
    return getRoute(Settings.values.elementAt(index));
  }
}
