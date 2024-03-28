import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:flutter/material.dart';

class AttentionContainer extends StatelessWidget {
  final String additionalText;
  final String mainText;
  final Function()? onTap;

  const AttentionContainer(
      {Key? key,
      required this.additionalText,
      required this.mainText,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.style.border.medium,
          color: context.style.color.attentionContainer,
        ),
        child: Padding(
          padding: context.style.padding.small,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Внимание! ',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(mainText),
                      ],
                    ),
                    Text(additionalText),
                  ],
                ),
              ),
              context.style.padding.w.small,
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onTap,
                  child: const Text(
                    'Продлить лицензию',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
