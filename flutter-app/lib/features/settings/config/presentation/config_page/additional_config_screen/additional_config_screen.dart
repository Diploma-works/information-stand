import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/settings/config/presentation/config_page/additional_config_screen/app_bar/additional_app_bar.dart';

class AdditionalConfigScreen extends StatelessWidget {
  const AdditionalConfigScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AdditionalAppBar(),
        body: AutoRouter(),
      );
  }
}
