import 'package:flutter/material.dart';
import 'package:information_stand/ui/ui_kit/components/component_color/component_color.dart';

abstract interface class MainLayoutColorKit{

  late Color appBar;

  late Color clock;

  late ComponentColor addButton;

  late ComponentColor acceptButton;

  Map<String, dynamic> toJson();


}