import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_list_config.freezed.dart';

part 'event_list_config.g.dart';

@freezed
class EventListConfig with _$EventListConfig {
  const factory EventListConfig({
    required bool hideEventName,
    required bool showOnlyOrganize,
  }) = _EventListConfig;

  factory EventListConfig.fromJson(Map<String, dynamic> json) => _$EventListConfigFromJson(json);
}
