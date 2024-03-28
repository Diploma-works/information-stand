import 'package:information_stand/features/settings/config/models/config/config.dart';
import 'package:information_stand/features/settings/config/models/enums/layouts.dart';
import 'package:injectable/injectable.dart';
import '../../const/config_const.dart';
import '../config_service.dart';
import '../config_storage/config_storage.dart';

@Singleton(as: ConfigService)
class MainConfigService implements ConfigService {
  Config? _config;
  final ConfigStorage storage;

  @override
  Config get config => _config ?? ConfigConst.base;

  set config(Config value) {
    _config = value;
  }

  @override
  String get password => config.mainConfig.password;

  MainConfigService(this.storage) {
    storage.getConfig().then((value) {
      if (value != null) {
        _config = value;
      } else {
        _config = ConfigConst.base;
      }
    });
  }

  Future<void> _changeConfig(Config Function() onSet) async {
    final newConfig = onSet();
    await setConfig(newConfig);
  }

  @override
  Future<void> setConfig(Config config) async {
    await storage.setConfig(config);
    _config = config;
  }

  @override
  Future<void> changePassword(String password) async {
    await _changeConfig(() {
      return config.copyWith(
          mainConfig: config.mainConfig.copyWith(password: password));
    });
  }

  @override
  Future<void> changeLayout(Layouts layout) async {
    await _changeConfig(() {
      return config.copyWith(
        layout: layout,
      );
    });
  }

  @override
  Future<void> resetAll() async {
    await storage.clear();
    await _changeConfig(() {
      return ConfigConst.base;
    });
  }
}
