import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:information_stand/features/currency/models/currency.dart';

part 'currency_rates.freezed.dart';
part 'currency_rates.g.dart';

@freezed
class CurrencyRates with _$CurrencyRates {
  const factory CurrencyRates({
    required DateTime Date,
    required Map<String, Currency> Valute,
  }) = _CurrencyRates;

  factory CurrencyRates.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRatesFromJson(json);
}
