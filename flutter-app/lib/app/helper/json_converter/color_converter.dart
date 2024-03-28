import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String json) {
    return Color(int.tryParse(json)??0);
  }

  @override
  String toJson(Color object) {
    return object.value.toString();
  }

}
