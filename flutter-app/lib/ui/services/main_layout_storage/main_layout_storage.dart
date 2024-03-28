

import 'package:information_stand/ui/ui_kit/layouts/main_layout_ui/main_layout_ui.dart';

abstract interface class MainLayoutStorage{

  Future<void> save(MainLayoutUi mainLayoutUi);

  Future<MainLayoutUi?> get();

  Future<void> clear();

}