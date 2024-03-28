import 'package:flutter/material.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';

class HomeButton extends StatelessWidget {
  final Function() goHome;

  const HomeButton({super.key, required this.goHome});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(
          foregroundColor: context.style.color.foreground,
        ),
        onPressed: goHome,
        icon: Icon(Icons.home));
  }
}
