import 'package:flutter/cupertino.dart';
import '../box/box.dart';
import '../box/main_box/main_h_box.dart';
import '../box/main_box/main_w_box.dart';
import '../padding_kit.dart';

class MainPaddingKit implements PaddingKit{

  const MainPaddingKit();


  @override
  final Box h = const MainHBox();

  @override
  final Box w = const MainWBox();

  @override
  final  EdgeInsets small = const EdgeInsets.all(10);

  @override
  final EdgeInsets medium = const EdgeInsets.all(20);

  @override
  final EdgeInsets large = const EdgeInsets.all(40);


}