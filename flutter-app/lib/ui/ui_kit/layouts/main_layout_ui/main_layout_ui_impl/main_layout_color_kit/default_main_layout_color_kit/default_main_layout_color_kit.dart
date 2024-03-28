import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:information_stand/app/helper/json_converter/color_converter.dart';
import 'package:information_stand/ui/ui_kit/components/component_color/component_color.dart';
import 'package:information_stand/ui/ui_kit/components/component_color/component_converter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../components/component_color/button_component_color/button_component_color.dart';
import '../../../../../components/component_color/status_container_component_color/default_component_color.dart';
import '../main_layout_color_kit.dart';

part 'default_main_layout_color_kit.g.dart';

@JsonSerializable()
class DefaultMainLayoutColorKit implements MainLayoutColorKit {
  DefaultMainLayoutColorKit();

  @ComponentConverter()
  @override
  ComponentColor addButton = ButtonComponentColor();

  @ColorConverter()
  @override
  Color appBar = const Color.fromRGBO(83, 154, 205, 1);

  @ColorConverter()
  @override
  Color clock = Colors.white;

  @ComponentConverter()
  @override
  ComponentColor acceptButton = DefaultComponentColor(
    background: Colors.white,
    foreground: Colors.black87,
  );

  factory DefaultMainLayoutColorKit.fromJson(Map<String, dynamic> json) =>
      _$DefaultMainLayoutColorKitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DefaultMainLayoutColorKitToJson(this);
}
