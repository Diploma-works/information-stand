import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SwitchFieldStl extends StatelessWidget {
  final String rowName;
  final bool initial;
  final Function(bool value) onChanged;

  const SwitchFieldStl(
      {Key? key,
      this.initial = false,
      this.rowName = '',
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            rowName,
            style: context.style.text.smallBold,
          ),
          Switch(
            value: initial,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
