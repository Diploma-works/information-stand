
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:information_stand/features/settings/config/models/enums/layouts.dart';
import 'package:information_stand/features/settings/config/models/main_config/main_config.dart';

part 'config.freezed.dart';

part 'config.g.dart';

@freezed
class Config with _$Config {
  const factory Config({
    required Layouts layout,
    required MainConfig mainConfig
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
