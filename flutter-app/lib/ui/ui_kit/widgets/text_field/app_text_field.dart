import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../theme/extensions/main_theme/main_theme_extension.dart';

class AppFormField extends StatefulWidget {
  const AppFormField(
      {Key? key,
      required this.labelText,
      this.initialValue,
      this.onSaved,
      this.suffixIcon,
      this.obscuredText = false,
      this.onChange,
      this.controller,
      this.keyboardType,
      this.inputFormatters})
      : super(key: key);

  final String labelText;
  final String? initialValue;
  final Function(String?)? onSaved;
  final Function(String?)? onChange;

  final Widget? suffixIcon;
  final bool? obscuredText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      onChanged: widget.onChange,
      style: context.style.text.medium,
      decoration: InputDecoration(
        labelText: widget.labelText,
        floatingLabelStyle: context.style.text.large,
        contentPadding: context.style.padding.medium,
        labelStyle: context.style.text.medium,
        suffixIcon: (widget.obscuredText == false)
            ? widget.suffixIcon
            : IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: const Icon(Icons.remove_red_eye_rounded),
              ),
      ),
      obscureText: (widget.obscuredText == true) ? obscure : false,
    );
  }
}
