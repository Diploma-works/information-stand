import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/home/presentation/home_page/layouts/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:information_stand/features/weather/presentation/current_weather/current_weather.dart';
import 'package:information_stand/features/weather/presentation/today_weather/today_weather.dart';
import 'package:information_stand/features/weather/services/weather_service/weather_service_interface.dart';
import 'package:information_stand/features/weather/state/weather_state/weather_state.dart';
import 'package:information_stand/global/di.dart';
import 'package:information_stand/ui/theme/app_theme/app_theme.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:information_stand/ui/ui_kit/widgets/button/circle_button.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

@RoutePage()
class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) =>
            WeatherState(getIt<WeatherServiceInterface>(), getIt<Logger>()),
        builder: (context, child) {
          final state = context.read<WeatherState>();
          return Scaffold(
            appBar: CustomAppBar(
              isHome: false,
              colorAppbar: context.watch<AppThemeState>().style.mainLayout.color.appBar,
              colorClockBox: context.style.mainLayout.color.clock,
            ),
            body: FutureBuilder<void>(
              future: state.getWeather(),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CurrentWeather(
                          weather: state.weatherData!.list.first,
                          city: state.weatherData!.city.name,
                        ),
                        context.style.padding.h.medium,
                        Center(
                          child: SizedBox(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: TodayWeather(
                              weather: state.weatherData!.list,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          );
        });
  }
}
