import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/models/config/config.dart';
import 'package:information_stand/features/settings/config/models/interfaces/i_config_cervice.dart';
import 'package:information_stand/features/settings/config/services/config_service.dart';
import 'package:information_stand/features/settings/config/state/main_layout_settings/main_layout_settings.dart';
import 'package:information_stand/features/settings/config/state/mixins/common_settings_mixin.dart';
import 'package:information_stand/features/settings/config/state/mixins/image_config_mixin.dart';
import 'package:information_stand/features/settings/config/state/mixins/theme_config_mixin.dart';
import 'package:information_stand/global/global.dart';
import 'package:information_stand/ui/services/ui_service.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../global/di.dart';
import '../models/enums/settings.dart';

class ConfigState
    with
        ChangeNotifier,
        CommonSettingsMixin,
        ImageConfigMixin,
        ThemeConfigMixin
    implements IConfigService {
  int currentPage = 0;
  final router = getIt<AppRouter>();

  @override
  Config config;

  @override
  ConfigService configService;

  @override
  UiService uiService = getIt<UiService>();

  @override
  MainLayoutSettings mainLayoutSettings = MainLayoutSettings();

  @override
  BuildContext get context => navigatorKey.currentContext!;

  ConfigState({required this.configService})
      : config = configService.config;

  void changePage({required int index}) {
    currentPage = index;
    router.replace(Settings.getRouteByIndex(index));
    notifyListeners();
  }

  void clear() {
    currentPage = 0;
  }


}
