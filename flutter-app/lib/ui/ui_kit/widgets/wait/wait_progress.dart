import 'package:flutter/material.dart';
import '../../../theme/extensions/main_theme/main_theme_extension.dart';

class WaitProgress extends StatelessWidget {
  const WaitProgress({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? context.style.color.icon,
    );
  }
}
