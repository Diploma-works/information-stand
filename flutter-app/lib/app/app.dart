import 'package:flutter/material.dart';
import 'package:information_stand/features/home/presentation/home_page/state/home_state/home_state_impl.dart';
import 'package:information_stand/features/home/presentation/home_page/state/home_state/home_state_mock.dart';
import 'package:information_stand/features/settings/config/services/config_service.dart';
import 'package:information_stand/features/settings/config/state/uticlock_config_state.dart';
import 'package:information_stand/ui/services/ui_service.dart';
import 'package:information_stand/ui/style/mainStyle/mainStyle.dart';
import 'package:information_stand/ui/style/style.dart';
import 'package:information_stand/ui/theme/app_theme/app_theme.dart';
import 'package:information_stand/ui/ui_kit/color/mainColorKit/main_color_kit.dart';
import 'package:provider/provider.dart';
import '../features/home/presentation/home_page/layouts/widgets/custom_app_bar/providers/image_provider_impl.dart';
import '../global/di.dart';
import '/app/routes/app_router.dart';

class App extends StatelessWidget {
  final _appRoute = getIt<AppRouter>();
  final _configService = getIt<ConfigService>();
  final _uiService = getIt<UiService>();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureProvider<Style?>(
      initialData: null,
      create: (BuildContext context) {
        return _uiService.loadStyles();
      },
      catchError: (context, error) {
        return MainStyle(color: MainColorKit());
      },
      builder: (context, child) {
        final style = context.watch<Style?>();

        if (style != null) {
          return ChangeNotifierProvider(
            create: (BuildContext context) {
              return AppThemeState(
                style: style,
                uiService: _uiService,
              );
            },
            builder: (context, child) {
              final appTheme = context.watch<AppThemeState>();

              return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (BuildContext context) => ImageProviderImpl(),
                  ),
                  ChangeNotifierProvider(
                    create: (BuildContext context) =>
                        ConfigState(configService: _configService),
                  ),
                  ChangeNotifierProvider(
                    create: (BuildContext context) => HomeStateForSettings(),
                  ),
                  ChangeNotifierProvider(
                    create: (BuildContext context) => HomeStateImpl(),
                  ),
                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: _appRoute.config(),
                  theme: appTheme.theme,
                ),
              );
            },
          );
        } else {
          return const Material(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
