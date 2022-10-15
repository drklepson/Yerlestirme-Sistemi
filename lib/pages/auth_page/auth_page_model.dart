import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';

class AuthPageModel {
  AuthPageModel() {
    userExist = authController.firestoreUser != null;
  }
  late final bool userExist;
  final authController = AuthController.to;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();
  final TextEditingController rankController = TextEditingController();
  final TextEditingController sehirController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    scoreController.dispose();
    rankController.dispose();
    sehirController.dispose();
  }

  void showResetPasswordDialog() {
    // Validator().email(emailController.text) == null &&
    //         emailController.text != ''
    //     ? Get.defaultDialog<void>(
    //         title: 'Şifre Sıfırlama',
    //         titlePadding: const EdgeInsets.all(16),
    //         contentPadding: const EdgeInsets.all(16),
    //         content: Text(
    //           // ignore: lines_longer_than_80_chars
    //           'Sıfırlama istediğiniz gönderileceği adres: \n ${emailController.text}',
    //           textAlign: TextAlign.center,
    //         ),
    //         textCancel: 'Vazgeç',
    //         textConfirm: 'Gönder',
    //         onCancel: Get.back<void>,
    //         onConfirm: () {
    //           authController.resetPassword(emailController.text);
    //           Get.back<void>();
    //         },
    //       )
    //     : Get.bottomSheet<void>(
    //         BottomSheet(
    //           onClosing: () {},
    //           builder: (context) {
    //             return const Text('E-posta adresinizi kontrol ediniz.');
    //           },
    //         ),
    //      );
  }

  Future<void> signIn(BuildContext context) async {
    await context
        .loading(
      AuthController.to.signIn(
        context,
        emailController.text,
        passwordController.text,
      ),
    )
        .whenComplete(() {
      if (AuthController.to.firebaseUser == null) {
      } else {
        context.pushNamedAndRemoveAll('/home');
      }
    });
  }

  Future<void> registerFunction(
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) async {
    final puan = double.tryParse(scoreController.text);
    final sira = int.tryParse(rankController.text);
    if ((formKey.currentState?.validate() ?? false) &&
        puan != null &&
        sira != null) {
      await context.loading(
        authController.register(
          context,
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          puan: puan,
          sehir: sehirController.text,
          sira: sira,
        ),
      );
    } else {
      print('Giriş Hatası');
    }
  }
}
