import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../theme/extensions/main_theme/main_theme_extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.prefixText,
      this.initialValue,
      this.enable = true,
      this.onSaved,
      this.suffixIcon,
      this.obscuredText = false,
      this.onChange,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.inputFormatters})
      : super(key: key);

  final bool enable;
  final String prefixText;
  final String? initialValue;
  final Function(String?)? onSaved;
  final Function(String?)? onChange;

  final Widget? suffixIcon;
  final bool? obscuredText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late bool hasFocus;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.initialValue);
    focusNode = FocusNode();
    focusNode.addListener(focusChange);
  }
  void focusChange() {
    if (focusNode.hasFocus != hasFocus) {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    }
  }
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: !widget.enable,
      inputFormatters: widget.inputFormatters,
      controller: textEditingController,
      keyboardType: widget.keyboardType,
      onSaved: widget.onSaved,
      focusNode: focusNode,
      onTap: () {
        hasFocus = focusNode.hasFocus;
        if (!focusNode.hasFocus) {
          final text = textEditingController.text;
          textEditingController.value = textEditingController.value.copyWith(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
        }
      },
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      style: context.style.text.greySmall.copyWith(
          color: widget.enable
              ? context.style.color.text
              : context.style.color.backGroundDarkContainer),
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          isDense: true,
          floatingLabelStyle: context.style.text.large,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: context.style.border.medium,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: context.style.border.medium,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: context.style.border.medium,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: context.style.border.medium,
          ),
          hintText: widget.hintText,
          hintStyle: widget.enable
              ? context.style.text.greySmall
                  .copyWith(color: context.style.color.greyText)
              : context.style.text.greySmall
                  .copyWith(color: context.style.color.backGroundDarkContainer),
          fillColor: Colors.transparent,
          contentPadding: context.style.padding.small,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.prefixText,
                  style: context.style.text.smallBold.copyWith(
                      color: widget.enable
                          ? context.style.color.text
                          : context.style.color.backGroundDarkContainer),
                ),
                context.style.padding.w.large,
              ],
            ),
          ),
          suffixIcon: widget.obscuredText == false
              ? widget.suffixIcon
              : IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye_rounded))),
      obscureText: (widget.obscuredText == true) ? obscure : false,
    );
  }
}
