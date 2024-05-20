// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Currency _$$_CurrencyFromJson(Map<String, dynamic> json) => _$_Currency(
      ID: json['ID'] as String,
      NumCode: json['NumCode'] as String,
      CharCode: json['CharCode'] as String,
      Nominal: (json['Nominal'] as num).toInt(),
      Name: json['Name'] as String,
      Value: (json['Value'] as num).toDouble(),
      Previous: (json['Previous'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CurrencyToJson(_$_Currency instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'NumCode': instance.NumCode,
      'CharCode': instance.CharCode,
      'Nominal': instance.Nominal,
      'Name': instance.Name,
      'Value': instance.Value,
      'Previous': instance.Previous,
    };
