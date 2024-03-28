import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:flutter/material.dart';
import 'icon_container.dart';

class SettingButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isActive;
  final bool isFirst;
  final bool isLast;

  const SettingButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isActive = false,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
            isFirst ? context.style.border.medium.bottomLeft.x : 0),
        bottom: Radius.circular(
            isLast ? context.style.border.medium.bottomLeft.x : 0),
      ),
      color: (isActive) ? context.style.color.active : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const IconContainer(),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: context.style.text.smallBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
