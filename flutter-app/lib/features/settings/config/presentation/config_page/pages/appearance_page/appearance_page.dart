import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/app/routes/app_router.dart';
import 'package:information_stand/features/settings/config/presentation/config_page/widgets/info_container.dart';
import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:provider/provider.dart';

import '../../../../models/enums/layouts.dart';
import '../../widgets/switch_field/switch_field_stl.dart';
import 'widgets/main_layout_preview.dart';

@RoutePage()
class AppearancePage extends StatefulWidget {
  const AppearancePage({Key? key}) : super(key: key);

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: context.style.padding.medium.copyWith(top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: InfoContainer(list: [
                      Column(
                        children: [
                          Builder(builder: (context) {
                            final state = context.watch<ConfigState>();
                            return SwitchFieldStl(
                              rowName: "Основная",
                              onChanged: (value) {
                                state.changeLayout(Layouts.main);
                              },
                              initial: state.config.layout == Layouts.main,
                            );
                          }),
                          Padding(
                            padding: context.style.padding.medium,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: const IgnorePointer(
                                      child: MainLayoutPreview())),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ElevatedButton(
                                onPressed: () {
                                  context.router
                                      .push(const MainLayoutSettingsRoute());
                                },
                                child: const Text('Настроить')),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  context.style.padding.w.large,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
