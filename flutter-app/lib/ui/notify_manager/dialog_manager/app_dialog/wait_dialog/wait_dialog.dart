import 'package:flutter/material.dart';
import '../../../../theme/extensions/main_theme/main_theme_extension.dart';
import '../app_dialog.dart';


class WaitDialogWidget extends AppDialog {

  const WaitDialogWidget({super.key,
    required super.title, super.description = '',
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
              title ?? 'Пожалуйста подождите',
              style: context.style.text.large,
              textAlign: TextAlign.center,
            ),
            context.style.padding.h.medium,
            const Center(child: CircularProgressIndicator()),
          ],
        ),
        context.style.padding.h.large,
      ],
    );
  }
}
