import 'dart:async';
import 'package:flutter/material.dart';
import 'package:information_stand/features/license/services/license_service/license_service_interface.dart';
import 'package:logger/logger.dart';

class LicenseState with ChangeNotifier {
  LicenseServiceInterface licenseService;
  Logger log;

  LicenseState(this.licenseService, this.log);

  Future<void> check({required Function next}) async {
    try {
      if (await licenseService.check()) {
        next();
      }
    } catch (exception) {
      log.e(exception);
    }
  }
}
