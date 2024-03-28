import 'package:flutter/cupertino.dart';
import 'package:information_stand/features/settings/config/models/enums/layouts.dart';
import 'package:information_stand/features/settings/config/models/interfaces/i_config_cervice.dart';

mixin CommonSettingsMixin implements ChangeNotifier, IConfigService {

  void changePassword(String? password) async {
    if (password != null && password.isNotEmpty) {
      await configService.changePassword(password);
    }
  }

  void changeLayout(Layouts layout) async{
    await configService.changeLayout(layout);
    config = configService.config;
    notifyListeners();
  }

}
