import 'dart:ui';
import 'package:flutter/src/painting/border_radius.dart';
import '../../border_kit.dart';

class MainBorderKit implements BorderKit{

  static const largeValue = 40.0;

  static const mediumValue = 20.0;

  static const smallValue = 10.0;

  const MainBorderKit();

  @override
  BorderRadius get large => const BorderRadius.all(Radius.circular(largeValue));

  @override
  BorderRadius get medium => const BorderRadius.all(Radius.circular(mediumValue));

  @override
  BorderRadius get small => const BorderRadius.all(Radius.circular(smallValue));

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }


}