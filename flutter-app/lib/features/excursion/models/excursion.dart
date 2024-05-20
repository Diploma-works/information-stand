import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:information_stand/features/excursion/models/reserved_member.dart';

part 'excursion.freezed.dart';
part 'excursion.g.dart';

@freezed
abstract class Excursion with _$Excursion {
  const factory Excursion({
    required int id,
    required String name,
    required String description,
    required String location,
    required int duration,
    required double cost,
    required String startTime,
    required String endTime,
    required double rating,
    required List<ReservedMember> reservedMembers,
    required int maxParticipants,
    required String base64Image,
  }) = _Excursion;

  factory Excursion.fromJson(Map<String, dynamic> json) =>
      _$ExcursionFromJson(json);
}