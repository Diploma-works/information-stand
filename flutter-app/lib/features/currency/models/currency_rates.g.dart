// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyRates _$$_CurrencyRatesFromJson(Map<String, dynamic> json) =>
    _$_CurrencyRates(
      Date: DateTime.parse(json['Date'] as String),
      Valute: (json['Valute'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Currency.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_CurrencyRatesToJson(_$_CurrencyRates instance) =>
    <String, dynamic>{
      'Date': instance.Date.toIso8601String(),
      'Valute': instance.Valute,
    };
