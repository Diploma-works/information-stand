import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/services/config_service.dart';
import '../../../../theme/extensions/main_theme/main_theme_extension.dart';
import '../../../../ui_kit/widgets/text_field/app_text_field.dart';
import '../app_dialog.dart';


class PasswordDialogWidget extends AppDialog {

  final ConfigService service;

  final Function() onTapConfirm;
  final String textButton;

  const PasswordDialogWidget({super.key,
    required super.title,
    required super.description,
    required this.onTapConfirm,
    required this.textButton,
    required this.service,
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
            AppFormField(
              labelText: 'Пароль',
              obscuredText: true,
              onChange: (value){

                if(service.password == value){
                  onTapConfirm();
                }
              },
            ),
          ],
        ),
        context.style.padding.h.large,
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => context.router.pop(),
                child: const Text('Отмена'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
