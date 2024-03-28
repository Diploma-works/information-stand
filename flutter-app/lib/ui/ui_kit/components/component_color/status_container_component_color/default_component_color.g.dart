// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_component_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultComponentColor _$DefaultComponentColorFromJson(
        Map<String, dynamic> json) =>
    DefaultComponentColor(
      background: const ColorConverter().fromJson(json['background'] as String),
      foreground: const ColorConverter().fromJson(json['foreground'] as String),
    );

Map<String, dynamic> _$DefaultComponentColorToJson(
        DefaultComponentColor instance) =>
    <String, dynamic>{
      'background': const ColorConverter().toJson(instance.background),
      'foreground': const ColorConverter().toJson(instance.foreground),
    };
