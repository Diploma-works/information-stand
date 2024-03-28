import 'package:information_stand/features/settings/config/models/config/config.dart';
import 'package:information_stand/features/settings/config/models/enums/layouts.dart';
import 'package:information_stand/features/settings/config/models/main_config/main_config.dart';

class ConfigConst{

  static const base = Config(
      layout: Layouts.main,
      mainConfig:  MainConfig(
          password: '0000',
      )
  );
}