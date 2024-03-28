import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/models/interfaces/i_config_cervice.dart';
import 'package:provider/provider.dart';
import '../../../../../ui/style/style.dart';
import '../../../../../ui/theme/app_theme/app_theme.dart';

mixin ThemeConfigMixin implements IConfigService {

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
  /// * Меняет основной цвет приложения
  ///
  void changeMainColorApp(Color color) {
    _changeStyle(() {
      style.color.buttonBackground = color;
      style.color.icon = color;
      return style;
    });
  }

  ///
  /// * Меняет цвет app bar
  ///
  void changeAppBarColor(Color color) {
    _changeStyle(() {
      style.mainLayout.color.appBar = color;
      return style;
    });
  }
}
