import 'package:auto_route/auto_route.dart';
import 'package:information_stand/app/routes/app_router.dart';
import 'package:information_stand/features/home/presentation/home_page/state/home_state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar/providers/image_provider_impl.dart';
import 'screens/background_image/background_image.dart';

class MainLayoutWidget extends StatelessWidget {
  final HomeState homeState;

  const MainLayoutWidget({super.key, required this.homeState});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(
          imageProvider: context.watch<ImageProviderImpl>(),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(PlacesRoute());
                    },
                    child: Text(
                      'Места города',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  context.style.padding.w.medium,
                  // Adjust the spacing between buttons
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(ExcursionRoute());
                    },
                    child: Text(
                      'Экскурсии',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
              context.style.padding.h.medium, // Adjust the spacing between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(WeatherRoute());
                    },
                    child: Text(
                      'Погода',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  context.style.padding.w.medium,
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(CurrencyRoute());
                    },
                    child: Text(
                      'Курс валют',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
