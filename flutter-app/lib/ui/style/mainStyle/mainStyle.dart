import 'package:information_stand/ui/ui_kit/layouts/main_layout_ui/main_layout_ui.dart';

import '../../ui_kit/border/border_kit.dart';
import '../../ui_kit/border/main_border/main_border_kit/main_border_kit.dart';
import '../../ui_kit/layouts/main_layout_ui/main_layout_ui_impl/main_layout_ui_impl.dart';
import '../../ui_kit/padding/main_padding_kit/main_padding_kit.dart';
import '../../ui_kit/padding/padding_kit.dart';
import '../../ui_kit/color/color_kit.dart';
import '../../ui_kit/text/mainTextKit/mainTextKit.dart';
import '../../ui_kit/text/text_kit.dart';
import '../style.dart';

class MainStyle implements Style{

  @override
  ColorKit color;

  MainStyle({required this.color});

  @override
  MainLayoutUi mainLayout = MainLayoutUiImpl();

  @override
  TextKit get text => MainTextKit(colors: color);

  @override
  PaddingKit get padding => const MainPaddingKit();

  @override
  BorderKit get border => const MainBorderKit();









}