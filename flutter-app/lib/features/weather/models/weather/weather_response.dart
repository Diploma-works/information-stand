import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:information_stand/features/weather/models/weather/city.dart';
import 'package:information_stand/features/weather/models/weather/weather_model.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
abstract class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    required List<WeatherModel> list,
    required City city,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}