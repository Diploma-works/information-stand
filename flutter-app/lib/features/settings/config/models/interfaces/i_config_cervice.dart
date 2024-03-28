
import 'package:flutter/cupertino.dart';
import 'package:information_stand/features/settings/config/models/config/config.dart';
import 'package:information_stand/features/settings/config/services/config_service.dart';
import 'package:information_stand/features/settings/config/state/main_layout_settings/main_layout_settings.dart';
import 'package:information_stand/ui/services/ui_service.dart';

abstract interface class IConfigService{

  late Config config;

  late UiService uiService;

  MainLayoutSettings get mainLayoutSettings;

  BuildContext get context;

  late ConfigService configService;

}