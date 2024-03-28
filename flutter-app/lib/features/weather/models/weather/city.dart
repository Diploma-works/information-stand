import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:information_stand/features/weather/models/weather/weather_model.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
abstract class City with _$City {
  const factory City({
    required int id,
    required String name,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);
}