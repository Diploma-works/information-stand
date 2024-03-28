import 'package:flutter/material.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';

class SwitchField extends StatefulWidget {

  final String name;
  final bool initial;
  final Function(bool value) onChanged;

  const SwitchField({super.key,required this.initial, required this.name, required this.onChanged});

  @override
  State<SwitchField> createState() => _SwitchFieldState();
}

class _SwitchFieldState extends State<SwitchField> {

  late bool value;

  @override
  void initState() {
    value = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.name,
          ),
        ),
        context.style.padding.w.medium,
        Switch(
          value: value,
          onChanged: change,
        ),
      ],
    );
  }

  void change(bool value){
    widget.onChanged(value);
    setState(() {
      value;
    });
  }

}
