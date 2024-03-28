import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:information_stand/features/home/presentation/home_page/state/home_state/home_state.dart';
import '../../../../../../app/routes/app_router.dart';
import '../../../../../../ui/notify_manager/notify_manager.dart';

class HomeStateImpl with ChangeNotifier implements HomeState {
  NotifyManager dialogs = NotifyManager.global();

  int count = 0;

  @override
  void onTapSettings(StackRouter router) {
    count += 1;
    if (count >= 5) {
      dialogs
          .showPassword(
              title: 'Настройки',
              description: '',
              onTapAccept: () {
                router.push(const ConfigRoute());
                dialogs.close();
              })
          .then((value) {
        count = 0;
      });
    }
  }
}
