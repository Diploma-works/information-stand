import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../theme/extensions/main_theme/main_theme_extension.dart';
import '../app_dialog.dart';


class ProcessDialog extends AppDialog {
  final StreamController<bool> checkedNotifier;
  final StreamController<double> progressNotifier;
  final String onDone;
  final CancelToken token;

  const ProcessDialog(
      {super.key, super.title,
        required super.description,
        required this.onDone,
        required this.checkedNotifier,
        required this.progressNotifier,
        required this.token});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? '',
              style: context.style.text.large,
            ),
            context.style.padding.h.medium,
            StreamBuilder(
              stream: progressNotifier.stream,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != 100) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            const CircularProgressIndicator(),
                            Container(
                              padding: context.style.padding.small,
                              child: Text(
                                description,
                                style: context.style.text.medium,
                              ),
                            )
                          ],
                        ),
                        Text('${snapshot.data!.toInt()} / 100')
                      ],
                    );
                  } else {
                    return Container(
                      padding: context.style.padding.small,
                      child: Text(
                        onDone,
                        style: context.style.text.medium,
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  // Handle error case
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Handle loading or initial state
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
        context.style.padding.h.large,
        StreamBuilder<bool>(
          stream: checkedNotifier.stream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ok'),
              );
            }
            return ElevatedButton(
              onPressed: () {
                token.cancel();
                Navigator.pop(context);
              },
              child: const Text('Прекратить обновление'),
            );
          },
        )
      ],
    );
  }
}
