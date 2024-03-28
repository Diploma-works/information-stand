import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:information_stand/ui/ui_kit/widgets/wait/wait_progress.dart';

@RoutePage()
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, required this.loadingText, this.backGround});

  final Color? backGround;
  final String loadingText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WaitProgress(),
            context.style.padding.h.medium,
            Text(
              loadingText,
              style: context.style.text.medium,
            ),
          ],
        ),
      ),
    );
  }
}
