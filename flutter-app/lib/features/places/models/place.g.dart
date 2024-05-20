// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Place _$$_PlaceFromJson(Map<String, dynamic> json) => _$_Place(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      base64Image: json['base64Image'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      workingHours: json['workingHours'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_PlaceToJson(_$_Place instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'base64Image': instance.base64Image,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'workingHours': instance.workingHours,
      'category': instance.category,
    };
