import 'package:flutter/material.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';

class CircleButton extends StatelessWidget {

  final Widget child;
  final Function() onTap;

  const CircleButton({super.key,required this.onTap,  required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: context.style.padding.small,
          child: child,
        ),
      ),
    );
  }
}
