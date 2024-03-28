import 'package:json_annotation/json_annotation.dart';

import '../main_layout_color_kit/default_main_layout_color_kit/default_main_layout_color_kit.dart';
import '../main_layout_color_kit/main_layout_color_kit.dart';

class MainLayoutColorKitConverter implements JsonConverter<MainLayoutColorKit, Map<String, dynamic>> {

  const MainLayoutColorKitConverter();

  @override
  MainLayoutColorKit fromJson(Map<String, dynamic> json) {
    return DefaultMainLayoutColorKit.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MainLayoutColorKit object) {
    return object.toJson();
  }

}