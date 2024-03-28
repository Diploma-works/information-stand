import 'package:flutter/material.dart';
import 'package:information_stand/ui/ui_kit/components/component_color/component_color.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';

class AddButton extends StatelessWidget {

  final Function() onTap;
  final ComponentColor color;

  const AddButton({super.key,required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color.background,
          padding: EdgeInsets.zero,
          minimumSize: const Size(70, 70),
          shape: RoundedRectangleBorder(
            borderRadius: context.style.border.medium,
          )
      ),
      onPressed: onTap,
      child:  Icon(Icons.add, size: 40, color: color.foreground,),
    );
  }
}
