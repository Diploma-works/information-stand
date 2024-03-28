import 'package:flutter/material.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? left;
  final Widget? center;
  final Widget? right;

  const SettingAppBar(
      {super.key,
       this.left,
       this.center,
       this.right});

  @override
  Size get preferredSize => Size(0, 70);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.style.text.medium,
      child: ColoredBox(
        color: context.style.color.foreground,
        child: SafeArea(
          child: Padding(
            padding: context.style.padding.small,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Align(
                    alignment: Alignment.centerLeft,
                    child: left??const SizedBox())),
                Expanded(child: center??const SizedBox()),
                Expanded(child: Align(
                    alignment: Alignment.centerRight,
                    child: right??const SizedBox())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
