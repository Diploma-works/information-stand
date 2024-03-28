// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
      layout: $enumDecode(_$LayoutsEnumMap, json['layout']),
      mainConfig:
          MainConfig.fromJson(json['mainConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'layout': _$LayoutsEnumMap[instance.layout]!,
      'mainConfig': instance.mainConfig,
    };

const _$LayoutsEnumMap = {
  Layouts.main: 'main',
  Layouts.dark: 'dark',
  Layouts.mini: 'mini',
  Layouts.vertical: 'vertical',
};
