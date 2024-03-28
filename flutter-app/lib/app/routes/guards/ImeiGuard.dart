import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:information_stand/features/license/services/license_service/license_service_interface.dart';
import '../../../features/license/services/license_service/exceptions/license_exception.dart';
import '../../../features/license/services/license_service/license_service/license_service.dart';
import '../app_router.dart';

class ImeiGuard extends AutoRouteGuard {
  final LicenseServiceInterface _license;

  const ImeiGuard(this._license);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      resolver.redirect(LoadingRoute(loadingText: 'Проверка лицензии...'));

      bool data = await _license.check();
      if (data) {
        resolver.next();
      } else {
        throw LicenseException("Вашего Imei нет в разрешенных");
      }
    } on LicenseException catch (exception, stackTrace) {
      resolver.redirect(const LicenseRoute());
    } catch (exception) {
      log(exception.toString());
      resolver.redirect(const LicenseRoute());
    }
  }
}
