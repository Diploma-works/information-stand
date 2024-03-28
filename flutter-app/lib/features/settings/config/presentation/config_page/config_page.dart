import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/presentation/config_page/additional_config_screen/additional_config_screen.dart';
import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';
import 'package:provider/provider.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'menu_screen/menu_screen.dart';

@RoutePage()
class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.style.color.backgroundScaffoldDark,
      body: DefaultTextStyle(
        style: context.style.text.medium,
        child:  Row(
          children: [
            Expanded(
              flex: 40,
              child: MenuScreen(
                onClearState: (){
                  final state = context.read<ConfigState>();
                  state.clear();
                },
              ),
            ),
            const VerticalDivider(),
            const Expanded(
                flex: 60,
                child: AdditionalConfigScreen()
            ),
          ],
        ),
      ),
    );
  }
}
