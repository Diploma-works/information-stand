
import 'package:information_stand/features/settings/config/models/config/config.dart';
import 'package:information_stand/features/settings/config/models/enums/layouts.dart';

abstract interface class ConfigService {

  Config get config;

  String get password;

  Future<void> setConfig(Config config);

  Future<void> changePassword(String password);

  Future<void> changeLayout(Layouts layout);

  Future<void> resetAll();
}
