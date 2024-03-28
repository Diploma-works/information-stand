import 'package:flutter/material.dart';
import '../../services/ui_service.dart';
import '../../style/style.dart';
import '../extensions/main_theme/main_theme_extension.dart';

class AppThemeState with ChangeNotifier {
  Style style;
  UiService uiService;

  AppThemeState({required this.style, required this.uiService});


  ThemeData get theme => ThemeData(
        dividerTheme: const DividerThemeData(space: 0),
        useMaterial3: true,
        dialogBackgroundColor: style.color.backGroundScaffold,
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: style.border.medium,
          ),
          elevation: 0,
        ),
        scaffoldBackgroundColor: style.color.backGroundScaffold,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: style.text.large.copyWith(
            color: style.color.backGroundDarkContainer,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: style.border.medium,
            borderSide: BorderSide(
              color: style.color.icon.withAlpha(100),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: style.border.medium,
            borderSide: BorderSide(
              color: style.color.icon,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: style.color.backGroundLight,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: style.border.small,
            )),
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return style.text.medium;
              } else {
                return style.text.medium;
              }
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (!states.contains(MaterialState.disabled)) {
                return style.color.foreground;
              }
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (!states.contains(MaterialState.disabled)) {
                return style.color.buttonBackground;
              }
            }),
            overlayColor:
                MaterialStateProperty.all(style.color.backGroundDarkContainer),
            minimumSize: MaterialStateProperty.all(const Size(300, 50)),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
          minimumSize: const Size(100, 100),
          iconSize: 70,
          foregroundColor: style.color.icon,
        )),
        extensions: [
          MainAppExtension(style: style),
        ],
      );

  void changeStyle(Style style) {
    this.style = style;
    uiService.saveStyle(style);
    notifyListeners();
  }
}
