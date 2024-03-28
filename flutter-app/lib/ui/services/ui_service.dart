import 'package:information_stand/ui/services/color_storage/color_storage.dart';
import 'package:information_stand/ui/style/mainStyle/mainStyle.dart';
import 'package:information_stand/ui/style/style.dart';
import 'package:information_stand/ui/ui_kit/color/color_kit.dart';
import 'package:information_stand/ui/ui_kit/color/mainColorKit/main_color_kit.dart';
import 'package:information_stand/ui/ui_kit/layouts/main_layout_ui/main_layout_ui.dart';
import 'package:injectable/injectable.dart';
import 'main_layout_storage/main_layout_storage.dart';

@Singleton()
class UiService {
  ColorStorage colorStorage;
  MainLayoutStorage mainLayoutStorage;

  UiService(this.colorStorage, this.mainLayoutStorage);

  Future<Style> loadStyles() async {
    var style = MainStyle(color: MainColorKit());

    final color = await getColorKit();
    final mainLayout = await getMainLayout();

    if (color != null) style.color = color;
    if (mainLayout != null) style.mainLayout = mainLayout;

    return style;
  }

  Future<void> saveStyle(Style style) async {

    await saveMainLayout(style.mainLayout);
    await saveColorKit(style.color);

  }

  Future<void> saveMainLayout(MainLayoutUi mainLayoutUi) async {
    await mainLayoutStorage.save(mainLayoutUi);
  }

  Future<MainLayoutUi?> getMainLayout() async {
    return await mainLayoutStorage.get();
  }

  Future<void> saveColorKit(ColorKit colorKit) async {
    await colorStorage.save(colorKit);
  }

  Future<ColorKit?> getColorKit() async {
    return await colorStorage.get();
  }
}
