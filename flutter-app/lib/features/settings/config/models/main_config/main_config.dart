import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_config.freezed.dart';

part 'main_config.g.dart';

@freezed
class MainConfig with _$MainConfig {
  const factory MainConfig({
    required String password,
  }) = _MainConfig;

  factory MainConfig.fromJson(Map<String, dynamic> json) => _$MainConfigFromJson(json);
}
