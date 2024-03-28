import 'package:flutter/material.dart';

///
/// * Интерфейс для цветовой схемы
///
abstract interface class ColorKit{

  ///
  ///  * Цвет заднего фона кнопки
  ///
  late Color buttonBackground;

  ///
  /// * Цвет переднего плана кнопки
  ///
  late Color buttonForeground;

  ///
  /// * Цвет иконки
  ///
  late Color icon;

  Color get backgroundScaffoldDark;

  Color get active;

  Color get text;

  Color get foreground;

  /// * For Scaffold
  Color get backGroundScaffold;

  Color get backGroundDarkContainer;

  Color get backGroundLight;

  Color get attentionContainer;

  Color get divider;

  Color get disable;

  Color get disableContainer;

  Color get enable;

  Color get greyText;


  Map<String, dynamic> toJson();

}