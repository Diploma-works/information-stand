import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/models/config/config.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'config_extension.tailor.dart';


@TailorMixin()
class ConfigExtension extends ThemeExtension<ConfigExtension> with _$ConfigExtensionTailorMixin{

  @override
  final Config config;


  ConfigExtension({required this.config,});


}