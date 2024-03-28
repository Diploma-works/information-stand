import 'package:flutter/material.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';


class BorderCloseButton extends StatelessWidget {

  final Function()? onTap;

  const BorderCloseButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: context.style.border.small.copyWith(
            topLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
          color: context.style.color.foreground),
      child: Material(
        borderRadius: context.style.border.small,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: context.style.border.small.copyWith(
            topLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
          onTap: onTap,
          child: Padding(
            padding: context.style.padding.small,
            child: Icon(
              Icons.close,
            ),
          ),
        ),
      ),
    );
  }
}
