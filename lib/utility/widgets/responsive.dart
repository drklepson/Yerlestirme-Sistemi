import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    required this.desktop,
    required this.tablet,
    required this.mobile,
    super.key,
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1280) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
