import 'package:flutter/material.dart';
import '../../../../theme/extensions/main_theme/main_theme_extension.dart';
import '../app_dialog.dart';


class AnswerDialogWidget extends AppDialog {
  final Function() onTapLeft;
  final Function() onTapRight;
  final String textButton;
  final String rightText;


  const AnswerDialogWidget({
    required super.title,
    required super.description,
    required this.onTapLeft,
    required this.onTapRight,
    required this.textButton,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? '',
              style: context.style.text.large,
              textAlign: TextAlign.center,
            ),
            context.style.padding.h.medium,
            Text(
              description,
              style: context.style.text.medium,
              textAlign: TextAlign.center,
            )
          ],
        ),
        context.style.padding.h.large,
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onTapLeft,
                child: Text(textButton),
              ),
            ),
            context.style.padding.w.medium,
            Expanded(
              child: ElevatedButton(
                onPressed: onTapRight,
                child: Text(rightText),
              ),
            ),
          ],
        )
      ],
    );
  }
}
