import 'dart:async';
import 'package:flutter/material.dart';
import 'package:information_stand/features/excursion/models/excursion.dart';
import 'package:information_stand/features/excursion/presentation/excursion_info_page/services/excursion_info_service/excursion_info_service_interface.dart';
import 'package:logger/logger.dart';

class ExcursionInfoState with ChangeNotifier {
  ExcursionInfoServiceInterface excursionInfoService;
  Logger log;

  ExcursionInfoState(this.excursionInfoService, this.log);

  Future<Excursion?> reservation(int excursionId, String credentials, int count) async {
    return await excursionInfoService.reservation(excursionId, credentials, count);
  }
}
