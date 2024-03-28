import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/license/services/license_service/license_service/license_service.dart';
import 'package:information_stand/features/license/services/license_service/license_service_interface.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../../../../ui/theme/extensions/main_theme/main_theme_extension.dart';
import '../../../../app/routes/app_router.dart';
import '../../../../global/di.dart';
import 'package:auto_route/auto_route.dart';

import '../../state/license_state/license_state.dart';

@RoutePage()
class LicensePage extends StatelessWidget {
  const LicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LicenseState(
        getIt<LicenseServiceInterface>(), getIt<Logger>()
      ),
      builder: (context, child) {
        final state = context.read<LicenseState>();
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ваша лицензия на приложение не активна. Пожалуйста, обратитесь к администратору ПО за получением доступа",
                  style: context.style.text.large, textAlign: TextAlign.center,
                ),
                context.style.padding.h.medium,
                ElevatedButton(
                    onPressed: () {
                      state.check(
                          next: () =>
                              context.router
                                  .replaceAll([const HomeRoute()]));
                    },
                    child: const Text(
                      "Обновить",
                    )),
                //UpdateButton()
              ],
            ),
          ),
        );
      },
    );
  }
}
