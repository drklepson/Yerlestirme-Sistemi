import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Page with custom transition functionality.
/// [child] is the content to be shown in the Route created by this page.
CustomTransitionPage<T> buildMyTransition<T>({
  required Widget child,
  String? name,
  Object? arguments,
  String? restorationId,
  LocalKey? key,
}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
    key: key,
    name: name,
    arguments: arguments,
    restorationId: restorationId,
    transitionDuration: const Duration(milliseconds: 700),
  );
}
