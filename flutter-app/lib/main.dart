import 'package:flutter/material.dart';
import 'app/app.dart';
import 'global/di.dart';

void main() async {
  await configureDependencies();
  runApp(App());
}
