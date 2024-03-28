
import 'package:flutter/material.dart';
import 'package:information_stand/app/helper/json_converter/color_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import '../color_kit.dart';

part 'main_color_kit.g.dart';


@JsonSerializable()
class MainColorKit implements ColorKit{

  MainColorKit();

  @ColorConverter()
  @override
  Color icon = const Color.fromRGBO(72,66,59,1);

  @ColorConverter()
  @override
  Color buttonBackground = const Color.fromRGBO(72,66,59,1);

  @ColorConverter()
  @override
  Color buttonForeground = Colors.white;

  @ColorConverter()
  @override
  Color foreground = const Color(0xFFF5F5F5);

  @ColorConverter()
  @override
  Color divider = Colors.black12;

  @ColorConverter()
  @override
  Color backGroundScaffold =  const Color(0xFFF5F5F5);

  @ColorConverter()
  @override
  Color  backGroundDarkContainer = const Color(0xFF9E9E9E);

  @ColorConverter()
  @override
  Color  backGroundLight = const Color(0xFFEEEEEE);

  @ColorConverter()
  @override
  Color disable = const Color(0xFFEEEEEE);

  @ColorConverter()
  @override
  Color enable = const Color(0xFFA5D6A7);

  @ColorConverter()
  @override
  Color text = Colors.black87;

  @ColorConverter()
  @override
  Color get active => const Color(0xFF4c91c8);

  @ColorConverter()
  @override
  Color get backgroundScaffoldDark => const Color(0xFFdbdbdb);

  @ColorConverter()
  @override
  Color get greyText => const Color(0xFF545357);

  @ColorConverter()
  @override
  Color get disableContainer => const Color(0xFFe3e0e4);

  @ColorConverter()
  @override
  Color get attentionContainer => const Color(0xFFfeffcf);//0xFFFFCFCF red color

  factory MainColorKit.fromJson(Map<String, dynamic> json) => _$MainColorKitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MainColorKitToJson(this);


}