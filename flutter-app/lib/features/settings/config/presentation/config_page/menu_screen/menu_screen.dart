import 'package:information_stand/features/settings/config/presentation/config_page/menu_screen/buttons/buttons.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'app_bar/main_app_bar.dart';

class MenuScreen extends StatelessWidget {

  final Function()? onClearState;

  const MenuScreen({super.key, this.onClearState});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value){
        onClearState?.call();
      },
      child: Scaffold(
        appBar:  MainAppBar(
          onClose: (){
            context.router.pop();
            onClearState?.call();
          },
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: context.style.padding.medium,
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  const MainAppBar().preferredSize.height -
                  context.style.padding.medium.top,
              child: const Column(
                children: [
                  Buttons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
