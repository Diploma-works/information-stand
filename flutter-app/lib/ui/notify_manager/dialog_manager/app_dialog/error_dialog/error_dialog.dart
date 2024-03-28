import 'package:flutter/material.dart';
import '../../../../theme/extensions/main_theme/main_theme_extension.dart';
import '../app_dialog.dart';

class ErrorDialogWidget extends AppDialog {
  ErrorDialogWidget({super.title, required super.description});

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
              title ?? "error",
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
        ElevatedButton(
          onPressed: () =>  Navigator.pop(context),
          child: Text("accept"),
        ),
      ],
    );
  }
}
