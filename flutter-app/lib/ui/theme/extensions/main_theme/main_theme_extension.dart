import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import '../../../style/style.dart';

part 'main_theme.tailor.dart';


@TailorMixin()
class MainAppExtension extends ThemeExtension<MainAppExtension> with _$MainThemeTailorMixin{

  final Style style;


  MainAppExtension({required this.style,});


}