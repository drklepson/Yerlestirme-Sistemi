// ignore_for_file: unnecessary_lambdas

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/context_extension.g.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> fetchDatas(BuildContext context) async {
    Future<void> userControl() async {
      await AuthController.to.firstInit().then((_) {
        if (AuthController.to.firebaseUser == null) {
          context.pushNamedAndRemoveAll('/auth');
        } else {
          context.pushNamedAndRemoveAll('/home');
        }
      }).onError((error, stackTrace) {
        print(error);
      });
    }

    if (!GetIt.I.isRegistered<AuthController>()) {
      GetIt.I.registerLazySingleton(AuthController.new);
      await GetIt.I
          .allReady(timeout: const Duration(seconds: 1))
          .then((_) => userControl());
    }
    await userControl();
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas(context);

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
