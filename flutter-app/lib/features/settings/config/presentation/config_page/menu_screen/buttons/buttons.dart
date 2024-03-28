import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:provider/provider.dart';
import '../../../../models/enums/settings.dart';
import '../../widgets/setting_button/setting_button.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.style.padding.medium,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: context.style.border.medium,
            color: context.style.color.foreground),
        child: Builder(builder: (context) {

          final currentPage = context.select<ConfigState, int>((value) => value.currentPage);
          final changePage = context.read<ConfigState>().changePage;


          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Settings.values.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SettingButton(
                      isActive: currentPage == index,
                      isFirst: (index == 0),
                      isLast: (index == Settings.values.length - 1),
                      text: Settings.getNameByIndex(index),
                      onTap: () => changePage(index: index),
                    ),
                    const Divider(),
                  ],
                );
              });
        }),
      ),
    );
  }
}
