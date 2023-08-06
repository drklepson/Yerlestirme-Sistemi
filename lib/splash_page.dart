// ignore_for_file: unnecessary_lambdas

import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/context_extension.g.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> fetchDatas(BuildContext context) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    await AuthController().firstInit().then((_) {
      if (AuthController().firestoreUser == null) {
        context.pushNamedAndRemoveAll('/auth');
      } else {
        context.pushNamedAndRemoveAll('/home');
      }
    }).onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas(context);

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CircularProgressIndicator(), Text('Sistem Açılıyor')],
        ),
      ),
    );
  }
}
