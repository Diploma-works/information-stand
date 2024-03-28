import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../theme/extensions/main_theme/main_theme_extension.dart';
import '../app_dialog.dart';


class ErrorDetailDialogWidget extends AppDialog {
  final Function() onTapDetail;

  const ErrorDetailDialogWidget(
      {super.title, required super.description, required this.onTapDetail});

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
              title ?? "Error",
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
          onPressed: () => Navigator.pop(context),
          child: Text("accept"),
        ),
        ElevatedButton(
          onPressed: onTapDetail,
          child: Text('Подробнее'),
        ),
      ],
    );
  }
}
