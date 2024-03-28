import 'package:information_stand/ui/ui_kit/layouts/main_layout_ui/main_layout_ui.dart';

import '../ui_kit/border/border_kit.dart';
import '../ui_kit/color/color_kit.dart';
import '../ui_kit/padding/padding_kit.dart';
import '../ui_kit/text/text_kit.dart';

abstract interface class Style {

  late ColorKit color;

  late MainLayoutUi mainLayout;

  TextKit get text;

  PaddingKit get padding;

  BorderKit get border;
}
