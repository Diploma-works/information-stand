import 'package:information_stand/ui/ui_kit/components/component_color/component_color.dart';
import 'package:flutter/material.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';

class FastButton extends StatelessWidget {
  final int minutes;
  final ComponentColor color;
  final Function()? onTap;
  final String Function(int minutes) convertMinutesToHour;
  final String Function(int minutes) getValueTime;

  const FastButton({
    super.key,
    required this.color,
    required this.minutes,
    required this.onTap,
    required this.convertMinutesToHour,
    required this.getValueTime,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(95, 95),
          shape: RoundedRectangleBorder(
            borderRadius: context.style.border.medium,
          ),
          backgroundColor: color.background,
          foregroundColor: (onTap != null)
              ? color.foreground
              : color.foreground.withOpacity(0.2)),
      onPressed: onTap,
      child: DefaultTextStyle(
        style: context.style.text.medium.copyWith(
          fontWeight: FontWeight.bold,
          color: (onTap != null)
              ? color.foreground
              : color.foreground.withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(convertMinutesToHour(minutes)),
            Text(getValueTime(minutes)),
          ],
        ),
      ),
    );
  }
}
