// ignore_for_file: unnecessary_lambdas

import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/controllers/router/route_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> fetchDatas(AuthController controller) async {
    await controller.firstInit().then((_) {
      if (controller.isLogin) return PagesEnum.home.go();
      return PagesEnum.login.go();
    }).onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas(context.read<AuthController>());

    return const Scaffold(
      body: Center(
        child: CustomCircularIndicator(
          size: 50,
          text: 'Sistem Açılıyor',
        ),
      ),
    );
  }
}
