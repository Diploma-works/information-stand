import 'package:information_stand/features/settings/config/services/config_service.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:information_stand/ui/ui_kit/widgets/text_field/custom_text_field.dart';

import '../../../../../../../../global/di.dart';


@routePage
class MainConfigPage extends StatelessWidget {
  const MainConfigPage({super.key});

  @override
  Widget build(BuildContext context) {

    final settings = getIt<ConfigService>();

    return Padding(
      padding: context.style.padding.large,
      child: Column(
        children: [
          Text(
            'Основные настройки',
            style: context.style.text.large,
          ),
          CustomTextField(
              prefixText: 'Пароль:',
              initialValue: settings.password,
              onChange: (value){
                settings.changePassword(value??'');
              },
            obscuredText: true,
          ),
        ],
      ),
    );
  }
}
