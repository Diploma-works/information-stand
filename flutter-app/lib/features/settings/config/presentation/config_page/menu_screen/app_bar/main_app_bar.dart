
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/ui/ui_kit/widgets/app_bar/setting_app_bar/setting_app_bar.dart';
import 'package:information_stand/ui/ui_kit/widgets/button/circle_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onClose;

  const MainAppBar({super.key, this.onClose});

  @override
  Size get preferredSize => const Size(0,70);

  @override
  Widget build(BuildContext context) {
    return  SettingAppBar(
      left: (context.router.canPop()) ?CircleButton(
        onTap: () => onClose?.call(),
        child: const Icon(
          Icons.close,
          size: 30,
        ),
      ) : null,
      center: const Text('Настройки'),
    );
  }
}
