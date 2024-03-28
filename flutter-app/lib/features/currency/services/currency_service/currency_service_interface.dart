import 'package:information_stand/features/currency/models/currency_rates.dart';

abstract interface class CurrencyServiceInterface {

  Future<CurrencyRates?> getCurrency();

}