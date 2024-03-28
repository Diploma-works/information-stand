import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:information_stand/features/settings/config/models/enums/layouts.dart';
import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';
import 'package:information_stand/ui/theme/app_theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'layouts/main_layout_screen/main_layout_screen.dart';
import 'state/home_state/home_state_impl.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final state = context.watch<ConfigState>();

    switch(state.config.layout){

      case Layouts.main:
          return  MainLayoutScreen(
            appThemeState: context.watch<AppThemeState>(),
            configState: context.watch<ConfigState>(),
            state: context.watch<HomeStateImpl>(),
          );
      case Layouts.mini:
        return const Text('mini layout');
      case Layouts.vertical:
        return const Text('vertical layout');
      default: {
        return const Text('default layout');
      }
    }

  }
}
