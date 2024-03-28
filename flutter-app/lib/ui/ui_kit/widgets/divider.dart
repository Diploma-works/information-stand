import 'package:flutter/material.dart';
import '../../theme/extensions/main_theme/main_theme_extension.dart';


class AppDivider extends StatelessWidget {

  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: context.style.color.divider,
          ),
        ),
      ],
    );
  }
}
