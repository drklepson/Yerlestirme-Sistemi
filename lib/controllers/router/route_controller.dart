// ignore_for_file: unused_element

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/controllers/router/pages_enum.dart';
import 'package:yerlestirme_update/main.dart';

export 'package:go_router/go_router.dart';
export 'pages_enum.dart';

/// This class contains all the information about the router.
class RouterController {
  /// You can use this getter to get the router.
  static GoRouter get router =>
      GoRouter.of(AppInfo.navigatorKey.currentContext!);

  /// This class contains all the information about the router.
  static final _router = GoRouter(
    navigatorKey: AppInfo.navigatorKey,
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: PagesEnum.routes,
    redirect: (context, state) {
      final authController = context.read<AuthController>();
      final userNotExist = authController.firestoreUser == null;

      if (state.uri.path == '/' && authController.initialized) {
        return PagesEnum.home.accessPath;
      }

      if (state.uri.path == '/home' && userNotExist) {
        return PagesEnum.login.accessPath;
      }

      if (state.uri.path == '/login' && !userNotExist) {
        return PagesEnum.home.accessPath;
      }

      return null;
    },
  );

  /// [routerConfig] is the configuration of the router.
  static final routerConfig = RouterConfig(
    routerDelegate: _router.routerDelegate,
    backButtonDispatcher: _router.backButtonDispatcher,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,
  );
}
