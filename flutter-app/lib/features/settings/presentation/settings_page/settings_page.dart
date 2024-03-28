import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';
import '../../../../app/routes/app_router.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: context.style.padding.large,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () =>
                          context.router.push(const ConfigRoute()),
                      icon: Icon(
                        Icons.settings,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
