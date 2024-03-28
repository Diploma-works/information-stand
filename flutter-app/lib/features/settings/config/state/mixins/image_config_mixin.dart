import 'dart:io';
import 'package:information_stand/features/home/presentation/home_page/layouts/widgets/custom_app_bar/providers/image_provider_impl.dart';
import 'package:provider/provider.dart';
import '../../../../../global/di.dart';
import '../../../../../global/global.dart';
import '../../../../../services/file_service/app_file_service/app_file_service.dart';

mixin ImageConfigMixin {
  changeBackground(File? file) async {
    if (file != null) {
      final state = navigatorKey.currentContext?.read<ImageProviderImpl>();

      if (state != null) {
        final service = getIt<AppFileService>();
        state.changeBackground(file);
        await service.changeBackground(file);
      }
    }
  }

  changeLogo(File? file) async {
    if (file != null) {
      final state = navigatorKey.currentContext?.read<ImageProviderImpl>();

      if (state != null) {
        final service = getIt<AppFileService>();
        state.changeLogo(file);
        await service.changeLogo(file);
      }
    }
  }
}
