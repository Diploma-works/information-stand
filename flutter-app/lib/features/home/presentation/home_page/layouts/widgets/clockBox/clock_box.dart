import 'package:flutter/material.dart';
import 'state/clock_state.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:provider/provider.dart';

class ClockBox extends StatelessWidget {

  final Color color;
  final CrossAxisAlignment? crossAxisAlignment;

  const ClockBox({Key? key, required this.color,this.crossAxisAlignment}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ClockState(),
      builder: (context, child) {

        final state = context.watch<ClockState>();

        return Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.end,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  state.time,
                  style: context.style.text.medium.copyWith(
                    height: 0,
                    color: color,
                  ),
                ),
              ),
            ),
            Text(
              state.date,
              style: context.style.text.medium.copyWith(
                height: 0,
                color: color,
              ),
            ),
          ],
        );
      },
    );
  }
}
