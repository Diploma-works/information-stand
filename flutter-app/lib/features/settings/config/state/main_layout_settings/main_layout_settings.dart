import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../../../../../global/global.dart';
import '../../../../../ui/style/style.dart';
import '../../../../../ui/theme/app_theme/app_theme.dart';

class MainLayoutSettings  {

  BuildContext get context => navigatorKey.currentContext!;

  ///
  /// * Возвращает текущий стиль приложения
  ///
  Style get style => context.read<AppThemeState>().style;

  ///
  /// * Изменяет стиль (Тему приложения).
  ///
  _changeStyle(Style Function() change) {
    final style = change();

    final themeState = context.read<AppThemeState>();
    themeState.changeStyle(style);
  }


  ///
  /// * Цвет AppBar
  ///
  void changeAppBarColor(Color color) {
    _changeStyle(() {
      style.mainLayout.color.appBar = color;
      return style;
    });
  }

  ///
  /// * Цвет Часов
  ///
  void changeClockColor(Color color) {
    _changeStyle(() {
      style.mainLayout.color.clock = color;
      return style;
    });
  }

  ///
  /// * Цвет background кнопки добавления события
  ///
  void changeBackGroundAddButtonColor(Color color) {
    _changeStyle(() {
      style.mainLayout.color.addButton.background = color;
      return style;
    });
  }

  ///
  /// * Цвет foreground  кнопок добавления события
  ///
  void changeForegroundAddButtonColor(Color color) {
    _changeStyle(() {
      style.mainLayout.color.addButton.foreground = color;
      return style;
    });
  }

  ///
  /// * Цвет background кнопки подтверждения события
  ///
  void changeBackGroundAcceptButtonColor(Color color) {
    _changeStyle(() {
      style.mainLayout.color.acceptButton.background = color;
      return style;
    });
  }

  ///
  /// * Цвет foreground  кнопок подтверждения события
  ///
  void changeForegroundAcceptButtonColor(Color color) {
    _changeStyle(() {
      style.mainLayout.color.acceptButton.foreground = color;
      return style;
    });
  }

}