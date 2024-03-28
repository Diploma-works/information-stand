import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/currency/services/currency_service/currency_service_interface.dart';
import 'package:information_stand/features/currency/state/currency_state/currency_state.dart';
import 'package:information_stand/global/di.dart';
import 'package:information_stand/ui/theme/app_theme/app_theme.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:information_stand/ui/ui_kit/widgets/button/circle_button.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../home/presentation/home_page/layouts/widgets/custom_app_bar/custom_app_bar.dart';

@RoutePage()
class CurrencyPage extends StatelessWidget {
  CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          CurrencyState(getIt<CurrencyServiceInterface>(), getIt<Logger>()),
      builder: (context, child) {
        final state = context.read<CurrencyState>();
        return Scaffold(
          appBar: CustomAppBar(
            isHome: false,
            colorAppbar: context.watch<AppThemeState>().style.mainLayout.color.appBar,
            colorClockBox: context.style.mainLayout.color.clock,
          ),
          body: FutureBuilder<void>(
            future: state.getCurrency(),
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
                        Colors.black12,
                        Colors.white12,
                      ],
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: state.currencyData!.Valute.length,
                    itemBuilder: (context, index) {
                      final currencyCode = state.currencyData!.Valute.keys.elementAt(index);
                      final currencyInfo = state.currencyData!.Valute[currencyCode];
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(currencyCode),
                              ),
                              title: Text(currencyInfo!.Name),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Текущее значение: ${currencyInfo.Value}'),
                                      Text(
                                        'Изменение: ${(currencyInfo.Value - currencyInfo.Previous).toStringAsFixed(4)}',
                                        style: TextStyle(
                                          color: (currencyInfo.Value - currencyInfo.Previous) >= 0
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                      Text('Номинал: ${currencyInfo.Nominal}'),
                                    ],
                                  ),
                                  Icon(
                                    (currencyInfo.Value - currencyInfo.Previous) >= 0
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    color: (currencyInfo.Value - currencyInfo.Previous) >= 0
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
