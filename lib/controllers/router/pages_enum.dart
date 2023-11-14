// ignore_for_file: unused_element

import 'package:flutter/widgets.dart';
import 'package:yerlestirme_update/controllers/router/build_transition.dart';
import 'package:yerlestirme_update/controllers/router/route_controller.dart';
import 'package:yerlestirme_update/pages/auth_page/auth_page_screen.dart';
import 'package:yerlestirme_update/pages/home-page/home_page.dart';
import 'package:yerlestirme_update/pages/splash_page/splash_page_screen.dart';

enum PagesEnum {
  splash(path: '/', name: 'Splash Page'),
  home(path: '/home', name: 'Home Page'),
  login(path: '/login', name: 'Login Page');

  const PagesEnum({
    required String path,
    required this.name,
    this.subPages,
    this.isSubPage = false,
  }) : _path = path;

  final String _path;
  final String name;
  final List<PagesEnum>? subPages;
  final bool isSubPage;

  PagesEnum get parent => PagesEnum.values.firstWhere(
        (element) => element.subPages?.contains(this) ?? false,
        orElse: () => PagesEnum.splash,
      );

  String get accessPath =>
      isSubPage ? '${parent.accessPath}/${_path.substring(1)}' : _path;

  /// [page] is the page.
  Widget get page => switch (this) {
        PagesEnum.splash => const SplashPage(),
        PagesEnum.login => const AuthPageScreen(),
        PagesEnum.home => const HomePage(),
      };

  /// [route] is the route of the page.
  GoRoute get route => GoRoute(
        path: isSubPage ? _path.substring(1) : _path,
        name: name,
        pageBuilder: (context, state) => buildMyTransition(
          child: page,
          name: name,
          arguments: state,
        ),
        routes: subPages?.map((e) => e.route).toList() ?? [],
      );

  /// [routes] is the list of all the pages.
  static List<GoRoute> get routes =>
      values.where((sub) => !sub.isSubPage).map((e) => e.route).toList();

  Future<T?> push<T>({Object? extra}) =>
      RouterController.router.push<T>(accessPath, extra: extra);

  void go({Object? extra}) =>
      RouterController.router.go(accessPath, extra: extra);

  Future<T?> replace<T>({Object? extra}) =>
      RouterController.router.replace<T>(accessPath, extra: extra);

  Future<T?> pushReplacement<T>({Object? extra}) =>
      RouterController.router.pushReplacement<T>(accessPath, extra: extra);

  Future<T?> pushNamed<T>({Object? extra}) =>
      RouterController.router.pushNamed<T>(name, extra: extra);
}
