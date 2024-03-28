import 'package:information_stand/ui/ui_kit/components/component_color/component_color.dart';
import 'package:json_annotation/json_annotation.dart';

import 'status_container_component_color/default_component_color.dart';

class ComponentConverter implements JsonConverter<ComponentColor, Map<String, dynamic>> {

  const ComponentConverter();

  @override
  ComponentColor fromJson(Map<String, dynamic> json) {
    return DefaultComponentColor.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ComponentColor object) {
    return object.toJson();
  }

}