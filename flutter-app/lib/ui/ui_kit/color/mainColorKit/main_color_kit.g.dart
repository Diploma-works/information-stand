// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_color_kit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainColorKit _$MainColorKitFromJson(Map<String, dynamic> json) => MainColorKit()
  ..icon = const ColorConverter().fromJson(json['icon'] as String)
  ..buttonBackground =
      const ColorConverter().fromJson(json['buttonBackground'] as String)
  ..buttonForeground =
      const ColorConverter().fromJson(json['buttonForeground'] as String)
  ..foreground = const ColorConverter().fromJson(json['foreground'] as String)
  ..divider = const ColorConverter().fromJson(json['divider'] as String)
  ..backGroundScaffold =
      const ColorConverter().fromJson(json['backGroundScaffold'] as String)
  ..backGroundDarkContainer =
      const ColorConverter().fromJson(json['backGroundDarkContainer'] as String)
  ..backGroundLight =
      const ColorConverter().fromJson(json['backGroundLight'] as String)
  ..disable = const ColorConverter().fromJson(json['disable'] as String)
  ..enable = const ColorConverter().fromJson(json['enable'] as String)
  ..text = const ColorConverter().fromJson(json['text'] as String);

Map<String, dynamic> _$MainColorKitToJson(MainColorKit instance) =>
    <String, dynamic>{
      'icon': const ColorConverter().toJson(instance.icon),
      'buttonBackground':
          const ColorConverter().toJson(instance.buttonBackground),
      'buttonForeground':
          const ColorConverter().toJson(instance.buttonForeground),
      'foreground': const ColorConverter().toJson(instance.foreground),
      'divider': const ColorConverter().toJson(instance.divider),
      'backGroundScaffold':
          const ColorConverter().toJson(instance.backGroundScaffold),
      'backGroundDarkContainer':
          const ColorConverter().toJson(instance.backGroundDarkContainer),
      'backGroundLight':
          const ColorConverter().toJson(instance.backGroundLight),
      'disable': const ColorConverter().toJson(instance.disable),
      'enable': const ColorConverter().toJson(instance.enable),
      'text': const ColorConverter().toJson(instance.text),
    };
