import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final Widget child;
  final Function() onPressed;

  const AppButton({super.key, required this.onPressed, required this.child,});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
