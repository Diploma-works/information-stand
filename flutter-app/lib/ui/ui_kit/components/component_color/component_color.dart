import 'package:flutter/material.dart';


///
/// * Компонентный стиль цвета.
///   Для случаев когда нужно 2 цвета (задний) (передний) цвет.
///
///   Например: Кнопка, Статус-контейнер.
abstract interface class ComponentColor{

  late Color foreground;

  late Color background;

  Map<String, dynamic> toJson();

}