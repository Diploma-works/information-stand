import 'package:information_stand/ui/ui_kit/layouts/main_layout_ui/main_layout_ui.dart';
import 'package:information_stand/ui/ui_kit/layouts/main_layout_ui/main_layout_ui_impl/main_layout_color_kit/main_layout_color_kit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'converter/main_layout_color_kit_converter.dart';
import 'main_layout_color_kit/default_main_layout_color_kit/default_main_layout_color_kit.dart';

part 'main_layout_ui_impl.g.dart';

@JsonSerializable()
class MainLayoutUiImpl implements MainLayoutUi {
  MainLayoutUiImpl();

  @MainLayoutColorKitConverter()
  @override
  MainLayoutColorKit color = DefaultMainLayoutColorKit();

  factory MainLayoutUiImpl.fromJson(Map<String, dynamic> json) =>
      _$MainLayoutUiImplFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MainLayoutUiImplToJson(this);
}
