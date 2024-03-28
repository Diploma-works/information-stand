import 'package:information_stand/features/settings/config/presentation/config_page/widgets/info_container.dart';
import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/ui/ui_kit/widgets/text_field/custom_text_field.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CommonSettingsScreen extends StatelessWidget {
  const CommonSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ConfigState>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: context.style.padding.medium.copyWith(
            top: 20,
          ),
          child: Column(
            children: [
              InfoContainer(list: [
                CustomTextField(
                  initialValue: state.configService.password,
                  onChange: state.changePassword,
                  prefixText: 'Пароль от настроек',
                  obscuredText: true,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
