// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excursion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Excursion _$$_ExcursionFromJson(Map<String, dynamic> json) => _$_Excursion(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      duration: json['duration'] as int,
      cost: (json['cost'] as num).toDouble(),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      rating: (json['rating'] as num).toDouble(),
      reservedMembers: (json['reservedMembers'] as List<dynamic>)
          .map((e) => ReservedMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxParticipants: json['maxParticipants'] as int,
      base64Image: json['base64Image'] as String,
    );

Map<String, dynamic> _$$_ExcursionToJson(_$_Excursion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'duration': instance.duration,
      'cost': instance.cost,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'rating': instance.rating,
      'reservedMembers': instance.reservedMembers,
      'maxParticipants': instance.maxParticipants,
      'base64Image': instance.base64Image,
    };
