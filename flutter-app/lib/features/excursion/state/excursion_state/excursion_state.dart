import 'dart:async';
import 'package:flutter/material.dart';
import 'package:information_stand/features/excursion/models/excursion.dart';
import 'package:information_stand/features/excursion/services/excursion_service/excursion_service_interface.dart';
import 'package:logger/logger.dart';

class ExcursionState with ChangeNotifier {
  ExcursionServiceInterface excursionService;
  Logger log;
  List<Excursion>? _excursion = [];

  ExcursionState(this.excursionService, this.log);

  List<Excursion>? get excursions => _excursion;

  Future<void> getExcursion() async {
    _excursion = await excursionService.getExcursions();
  }

  void refreshExcursion(Excursion excursion) {
    for (var i in _excursion!) {
      if (i.id == excursion.id) {
        i = excursion;
      }
    }
  }
}
