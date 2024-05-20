import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/excursion/presentation/widgets/excursion_grid.dart';
import 'package:information_stand/features/excursion/services/excursion_service/excursion_service_interface.dart';
import 'package:information_stand/features/excursion/state/excursion_state/excursion_state.dart';
import 'package:information_stand/features/home/presentation/home_page/layouts/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:information_stand/global/di.dart';
import 'package:information_stand/ui/theme/app_theme/app_theme.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ExcursionPage extends StatelessWidget {
  const ExcursionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) =>
            ExcursionState(getIt<ExcursionServiceInterface>(), getIt<Logger>()),
        builder: (context, child) {
          final state = context.read<ExcursionState>();
          return Scaffold(
            appBar: CustomAppBar(
              isHome: false,
              colorAppbar:
                  context.watch<AppThemeState>().style.mainLayout.color.appBar,
              colorClockBox: context.style.mainLayout.color.clock,
            ),
            body: FutureBuilder<void>(
              future: state.getExcursion(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyan,
                          Colors.lightBlue,
                        ],
                      ),
                    ),
                    child: ExcursionGrid(
                      excursions: state.excursions!,
                      state: state,
                    ),
                  );
                }
              },
            ),
          );
        });
  }
}
