import 'dart:async';

import 'package:drklepson_utility_package/drklepson_utility_package.dart'
    hide ContextNavigator;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yerlestirme_update/const/default_strings.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/controllers/router/route_controller.dart';

import 'package:yerlestirme_update/main.dart';

const successText = '''
Şifre sıfırlama bağlantısı gönderildi
Lütfen e-postanızı ve spam klasörünü konrol edin.''';

Future<bool?> errorToast(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    webPosition: 'left',
    webShowClose: true,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    webBgColor: '#e74c3c',
  );
}

class AuthPageModel {
  AuthPageModel({required this.authController});

  final AuthController authController;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();
  final TextEditingController rankController = TextEditingController();
  final TextEditingController sehirController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    scoreController.dispose();
    rankController.dispose();
    sehirController.dispose();
  }

  void showResetPasswordDialog() {
    CustomValidator.email(emailController.text) == null &&
            emailController.text.isNotEmpty
        ? _showResetPwdDialog()
        : errorToast('Geçerli Bir Email Giriniz');
  }

  Future<void> _showResetPwdDialog() {
    return DialogManager.show(
      builder: (dialogContext) {
        return CustomAlertDialog(
          title: DefaultStrings.resetPassword,
          content: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Sıfırlama istediğiniz gönderileceği adres: ',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: emailController.text,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                DialogManager.futureLoading(
                  authController.resetPassword(emailController.text),
                ).then((_) {
                  dialogContext.pop();
                  _showSuccessDialog();
                }).onError(
                  (error, _) {
                    errorToast(error.toString());
                    return null;
                  },
                );
              },
              child: const Text('Onayla'),
            ),
            OutlinedButton(
              onPressed: dialogContext.pop,
              child: const Text('Vazgeç'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSuccessDialog() {
    return showDialog<void>(
      context: AppInfo.navigatorKey.currentContext!,
      builder: (successContext) {
        return CustomAlertDialog(
          title: 'Başarılı',
          content: const Text(
            successText,
            textAlign: TextAlign.center,
          ),
          actions: [
            ElevatedButton(
              onPressed: successContext.pop,
              child: const Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  Future<void> signIn() async {
    try {
      final value = await DialogManager.futureLoading(
        AuthController().signIn(emailController.text, passwordController.text),
      );
      if (value != null) PagesEnum.home.go();
    } catch (e) {
      unawaited(errorToast(e.toString()));
      return;
    }
  }

  Future<void> registerFunction() async {
    final puan = double.tryParse(scoreController.text);
    final sira = int.tryParse(rankController.text);
    if (puan == null || sira == null) {
      unawaited(errorToast('Lütfen Puan ve Sıra Alanlarını Doldurunuz'));
      return;
    }
    if ((registerFormKey.currentState?.validate() ?? false) &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        sehirController.text.isNotEmpty) {
      await DialogManager.futureLoading(
        authController.register(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          puan: puan,
          sehir: sehirController.text,
          sira: sira,
        ),
      ).onError(
        (error, stackTrace) => errorToast(error.toString()),
      );
    } else {
      unawaited(errorToast('Lütfen Tüm Alanları Doldurunuz'));
    }
  }
}
