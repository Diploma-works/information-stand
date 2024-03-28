import 'dart:ui';

import 'package:information_stand/app/helper/json_converter/color_converter.dart';
import 'package:information_stand/ui/ui_kit/components/component_color/component_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'default_component_color.g.dart';


@JsonSerializable()
class DefaultComponentColor implements ComponentColor{

  @ColorConverter()
  @override
  Color background;

  @ColorConverter()
  @override
  Color foreground;

  DefaultComponentColor({required this.background, required this.foreground});


  factory DefaultComponentColor.fromJson(Map<String, dynamic> json) => _$DefaultComponentColorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DefaultComponentColorToJson(this);

}
