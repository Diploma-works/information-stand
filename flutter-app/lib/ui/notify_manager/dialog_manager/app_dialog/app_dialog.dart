import 'package:flutter/material.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';

class AppDialog extends StatelessWidget {

  final Widget? child;
  const AppDialog(
      {super.key, this.title, required this.description, this.exception, this.child});

  final String? title;
  final String description;
  final Object? exception;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title??'', style: context.style.text.medium.copyWith(
          color: context.style.color.text,
        ),),
        child??Dialog(),
      ],
    );
  }
}
