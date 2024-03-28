import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../global/global.dart';
import 'dialog_manager/app_dialog/app_dialog.dart';
import 'dialog_manager/dialog_manager.dart';

abstract interface class NotifyManager {
  static NotifyManager of(BuildContext context, {Function? callBack}) {
    return DialogNotifyManger(context: context, callBack: callBack);
  }

  static NotifyManager global({Function? callBack}) {
    return DialogNotifyManger(
        context: navigatorKey.currentState!.context, callBack: callBack);
  }

  Future<void> show(AppDialog child, {bool over = false, Color? color});

  Future<void> showError(
      {String? title, required String description, Object? exception});

  Future<void> showWait({String? title});

  Future<void> showAccept({
    String? title,
    required String description,
    String textButton,
    required Function() onTapAccept,
  });

  Future<void> showErrorWithDetail(
      {String? title,
      required String description,
      required Object exception,
      required StackTrace? stackTrace,
      Object? detail});

  Future<void> showProcess(
      {String? title,
      required String description,
      required String onDone,
      required StreamController<bool> checked,
      required StreamController<double> progress,
      required CancelToken token});

  void close();
  Future<void> showPassword({
    String? title,
    required String description,
    String textButton = 'OK',
    required Function() onTapAccept,
});
}
