import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
abstract class Place with _$Place {
  const factory Place({
    int? id,
    required String name,
    required String description,
    required String base64Image,
    required double latitude,
    required double longitude,
    required String address,
    String? phoneNumber,
    required String workingHours,
    required String category,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) =>
      _$PlaceFromJson(json);
}
