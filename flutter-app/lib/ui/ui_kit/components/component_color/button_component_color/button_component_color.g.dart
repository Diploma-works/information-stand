// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_component_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonComponentColor _$ButtonComponentColorFromJson(
        Map<String, dynamic> json) =>
    ButtonComponentColor()
      ..background =
          const ColorConverter().fromJson(json['background'] as String)
      ..foreground =
          const ColorConverter().fromJson(json['foreground'] as String);

Map<String, dynamic> _$ButtonComponentColorToJson(
        ButtonComponentColor instance) =>
    <String, dynamic>{
      'background': const ColorConverter().toJson(instance.background),
      'foreground': const ColorConverter().toJson(instance.foreground),
    };
