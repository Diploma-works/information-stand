import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';
import 'package:information_stand/ui/theme/app_theme/app_theme.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../state/home_state/home_state.dart';
import 'main_layout_widget.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';

class MainLayoutScreen extends StatelessWidget {
  final HomeState state;
  final AppThemeState appThemeState;
  final ConfigState configState;

  const MainLayoutScreen(
      {super.key,required this.state, required this.appThemeState, required this.configState});

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    final color = appThemeState.style.mainLayout.color;
    final config = configState.config;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        isHome: true,
        colorAppbar: color.appBar,
        onTap: () => state.onTapSettings(context.router),
        colorClockBox: context.style.mainLayout.color.clock,
      ),
      body: MainLayoutWidget(
        homeState: state
      ),
    );
  }
}
