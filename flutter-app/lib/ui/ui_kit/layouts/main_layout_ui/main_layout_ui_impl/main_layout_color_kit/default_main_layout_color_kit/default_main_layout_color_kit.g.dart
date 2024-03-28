// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_main_layout_color_kit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultMainLayoutColorKit _$DefaultMainLayoutColorKitFromJson(
        Map<String, dynamic> json) =>
    DefaultMainLayoutColorKit()
      ..addButton = const ComponentConverter()
          .fromJson(json['addButton'] as Map<String, dynamic>)
      ..appBar = const ColorConverter().fromJson(json['appBar'] as String)
      ..clock = const ColorConverter().fromJson(json['clock'] as String)
      ..acceptButton = const ComponentConverter()
          .fromJson(json['acceptButton'] as Map<String, dynamic>);

Map<String, dynamic> _$DefaultMainLayoutColorKitToJson(
        DefaultMainLayoutColorKit instance) =>
    <String, dynamic>{
      'addButton': const ComponentConverter().toJson(instance.addButton),
      'appBar': const ColorConverter().toJson(instance.appBar),
      'clock': const ColorConverter().toJson(instance.clock),
      'acceptButton': const ComponentConverter().toJson(instance.acceptButton),
    };
