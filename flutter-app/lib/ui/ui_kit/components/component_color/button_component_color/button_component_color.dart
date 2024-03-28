
import 'package:flutter/material.dart';
import 'package:information_stand/app/helper/json_converter/color_converter.dart';
import 'package:information_stand/ui/ui_kit/components/component_color/component_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'button_component_color.g.dart';



@JsonSerializable()
class ButtonComponentColor implements ComponentColor{

  ButtonComponentColor();

  @ColorConverter()
  @override
  Color background = const Color.fromRGBO(72,66,59,1);

  @ColorConverter()
  @override
  Color foreground = Colors.white;

  factory ButtonComponentColor.fromJson(Map<String, dynamic> json) => _$ButtonComponentColorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ButtonComponentColorToJson(this);


}
