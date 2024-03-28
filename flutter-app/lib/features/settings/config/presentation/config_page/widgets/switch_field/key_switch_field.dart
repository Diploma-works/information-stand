import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class KeySwitchField extends StatefulWidget {
  final String rowName;
  final bool initial;
  final Function(bool value) onChanged;

  const KeySwitchField(
      {Key? key,
      this.initial = false,
      this.rowName = '',
      required this.onChanged})
      : super(key: key);

  @override
  State<KeySwitchField> createState() => _KeySwitchFieldState();
}

class _KeySwitchFieldState extends State<KeySwitchField> {
  late bool value;

  @override
  void initState() {
    value = widget.initial;
    super.initState();
  }

  _changeValue(bool newValue) {
    setState(() {
      value = newValue;
    });
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            widget.rowName,
            style: context.style.text.smallBold,
          ),
          Switch(
            value: value,
            onChanged: _changeValue,
          )
        ],
      ),
    );
  }
}
