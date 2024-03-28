import 'dart:async';
import 'package:flutter/material.dart';
import 'package:information_stand/features/currency/models/currency_rates.dart';
import 'package:information_stand/features/currency/services/currency_service/currency_service_interface.dart';
import 'package:logger/logger.dart';

class CurrencyState with ChangeNotifier {
  CurrencyServiceInterface currencyService;
  Logger log;
  CurrencyRates? _currencyData;

  CurrencyState(this.currencyService, this.log);

  CurrencyRates? get currencyData => _currencyData;

  Future<void> getCurrency() async {
    _currencyData = await currencyService.getCurrency();
  }
}
