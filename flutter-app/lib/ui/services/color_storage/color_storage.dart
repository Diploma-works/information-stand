import '../../ui_kit/color/color_kit.dart';

abstract interface class ColorStorage{

  Future<void> save(ColorKit kit);

  Future<ColorKit?> get();

  Future<void> clear();

}