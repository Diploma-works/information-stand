import 'package:flutter/material.dart';
import '../box.dart';

class MainWBox implements Box {

  const MainWBox();

  @override
  SizedBox get large => const SizedBox(width: 40);

  @override
  SizedBox get medium => const SizedBox(width: 20);

  @override
  SizedBox get small => const SizedBox(width: 10);
}
