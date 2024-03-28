import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:information_stand/features/weather/models/weather/main.dart';
import 'package:information_stand/features/weather/models/weather/weather.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required Main main,
    required List<Weather> weather,
    required String dt_txt,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}