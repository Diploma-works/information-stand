import 'package:flutter/material.dart';
import '../box.dart';

class MainHBox implements Box {

  const MainHBox();

  @override
  SizedBox get large => const SizedBox(height: 40);

  @override
  SizedBox get medium => const SizedBox(height: 20);

  @override
  SizedBox get small => const SizedBox(height: 10);
}
