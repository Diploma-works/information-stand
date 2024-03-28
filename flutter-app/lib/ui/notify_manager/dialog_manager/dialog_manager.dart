import 'dart:async';
import 'package:dio/src/cancel_token.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/services/config_service.dart';
import '/global/di.dart';
import 'app_dialog/answer_dialog/answer_dialog.dart';
import 'app_dialog/app_dialog.dart';
import 'app_dialog/error_dialog/error_dialog.dart';
import 'app_dialog/password_dialog/password_dialog.dart';
import 'app_dialog/process_dialog/process_dialog.dart';
import 'app_dialog/wait_dialog/wait_dialog.dart';
import '../../theme/extensions/main_theme/main_theme_extension.dart';
import '../notify_manager.dart';
import 'app_dialog/error_detail_dialog/error_detail_dialog.dart';


class DialogNotifyManger implements NotifyManager {
  static bool isView = false;

  BuildContext context;
  Function? callBack;

  DialogNotifyManger({
    required this.context,
    this.callBack,
  });

  @override
  Future<void> showError({
    String? title,
    required String description,
    Object? exception,
  }) async {
    await show(ErrorDialogWidget(
      title: title,
      description: description,
    ));
  }

  @override
  Future<void> show(AppDialog child, {bool over = false, bool barrierDismissible = true, Color? color}) async {
    //todo: Оптимизировать логику

    if (over) {
      showDialog(
          barrierDismissible: barrierDismissible,
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: Theme.of(context).copyWith(
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style:
                          Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                minimumSize:
                                    const MaterialStatePropertyAll(Size(250, 40)),
                              ))),
              child: SimpleDialog(
                backgroundColor: color,
                alignment: Alignment.center,
                contentPadding: context.style.padding.medium,
                children: [
                  ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 500,
                        minHeight: 100,
                      ),
                      child: child)
                ],
              ),
            );
          });
    } else {
      if (!isView) {
        isView = true;
        showDialog(
            barrierDismissible: barrierDismissible,
            context: context,
            builder: (BuildContext context) {
              return Theme(
                data: Theme.of(context).copyWith(
                    elevatedButtonTheme: ElevatedButtonThemeData(
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              minimumSize:
                                  const MaterialStatePropertyAll(Size(250, 40)),
                            ))),
                child: SimpleDialog(
                  backgroundColor: color,
                  alignment: Alignment.center,
                  contentPadding: context.style.padding.medium,
                  children: [child],
                ),
              );
            }).then((value) {
          isView = false;
          if (callBack != null) {
            callBack!();
          }
        });
      }
    }
  }

  @override
  Future<void> showErrorWithDetail(
      {String? title,
      required String description,
      required Object exception,
      required StackTrace? stackTrace,
      Object? detail}) async {
    await show(
      ErrorDetailDialogWidget(
        title: title,
        description: description,
        onTapDetail: () {
          show(ErrorDialogWidget(
              title: 'Детали',
              description:
                  '$exception \n _____ \n stackTrace: \n $stackTrace'));
        },
      ),
      over: true,
    );
  }

  @override
  Future<void> showWait({
    String? title,
  }) async {
    await show(WaitDialogWidget(title: title));
  }

  @override
  Future<void> showAccept({
    String? title,
    required String description,
    String textButton = 'Перейти',
    required Function() onTapAccept,
  }) async {
    await show(AnswerDialogWidget(
      title: title,
      description: description,
      onTapLeft: () async {
        await onTapAccept();
        Navigator.pop(context);
      },
      textButton: textButton,
      onTapRight: () => Navigator.pop(context),
      rightText: 'Отмена',
    ));
  }

  @override
  Future<void> showProcess(
      {String? title,
      required String description,
      required String onDone,
      required StreamController<bool> checked,
      required StreamController<double> progress,
      required CancelToken token}) async {
    await show(ProcessDialog(
      title: title,
      description: description,
      onDone: onDone,
      checkedNotifier: checked,
      progressNotifier: progress,
      token: token,
    ));
  }

  @override
  Future<void> showPassword({
    String? title,
    required String description,
    String textButton = 'OK',
    required Function() onTapAccept,
  }) async {
    await show(PasswordDialogWidget(
      title: title,
      description: description,
      onTapConfirm: onTapAccept,
      textButton: textButton,
      service: getIt<ConfigService>(),
    ),
    barrierDismissible: false,
    );
  }

  @override
  void close() {
    if(isView){
      Navigator.of(context).pop();
      isView = false;
    }
  }
}
