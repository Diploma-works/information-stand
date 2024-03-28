import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class KeyField extends StatelessWidget {
  final String name;
  final String rowName;

  const KeyField({Key? key, this.rowName = '', required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(rowName,style: context.style.text.smallBold,),
              AutoSizeText(name,style: context.style.text.greySmall,),
            ],
          ),
        ),
      ],
    );
  }
}
