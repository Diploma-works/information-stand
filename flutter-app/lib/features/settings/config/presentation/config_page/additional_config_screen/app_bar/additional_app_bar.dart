import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/models/enums/settings.dart';
import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';

import 'package:information_stand/ui/ui_kit/widgets/app_bar/setting_app_bar/setting_app_bar.dart';
import 'package:provider/provider.dart';


class AdditionalAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AdditionalAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(0, 70);

  @override
  State<AdditionalAppBar> createState() => _AdditionalAppBarState();
}

class _AdditionalAppBarState extends State<AdditionalAppBar> {

  @override
  Widget build(BuildContext context) {
    return SettingAppBar(
      center: Builder(builder: (context) {
        final index = context.watch<ConfigState>().currentPage;

        return Center(child: Text(Settings.getNameByIndex(index)));
      }),
    );
  }
}
