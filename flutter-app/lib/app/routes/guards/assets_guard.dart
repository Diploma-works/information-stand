import 'package:auto_route/auto_route.dart';
import '../../../services/file_service/file_service.dart';
import '../app_router.dart';

class AssetsGuard extends AutoRouteGuard {
  final FileService _service;

  const AssetsGuard(this._service);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    resolver.redirect(
        LoadingRoute(loadingText: 'Загрузка конфигурации...'));

    await _service.initAssets([
      'assets/images/logo.png',
      'assets/images/background.jpg'
    ]);

    resolver.next();

  }
}
