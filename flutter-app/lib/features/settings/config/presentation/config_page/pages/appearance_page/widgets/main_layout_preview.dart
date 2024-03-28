import 'package:flutter/material.dart';
import 'package:information_stand/features/home/presentation/home_page/layouts/main_layout_screen/main_layout_screen.dart';
import 'package:information_stand/features/home/presentation/home_page/state/home_state/home_state_mock.dart';
import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';
import 'package:information_stand/ui/theme/app_theme/app_theme.dart';
import 'package:provider/provider.dart';

class MainLayoutPreview extends StatelessWidget {
  const MainLayoutPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayoutScreen(
      state: context.watch<HomeStateForSettings>(),
      configState: context.watch<ConfigState>(),
      appThemeState: context.watch<AppThemeState>(),
    );
  }
}
