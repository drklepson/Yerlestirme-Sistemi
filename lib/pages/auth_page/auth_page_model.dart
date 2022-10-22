import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/helpers/global_variables.dart';
import 'package:yerlestirme_update/helpers/validators/validator.dart';
import 'package:yerlestirme_update/utility/widgets/alert_dialog.dart';

class AuthPageModel {
  AuthPageModel() {
    userExist = authController.firestoreUser != null;
  }
  late final bool userExist;
  final authController = AuthController();
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

  void showResetPasswordDialog(BuildContext context) {
    CustomValidator.email(emailController.text) == null &&
            emailController.text != ''
        ? showDialog<void>(
            context: context,
            builder: (dialogContext) => CustomAlertDialog(
              titleText: 'Şifre Sıfırlama',
              content: Text(
                '''
Sıfırlama istediğiniz gönderileceği adres: 
${emailController.text}''',
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context
                        .loading(
                      AuthController().resetPassword(emailController.text),
                    )
                        .then((_) {
                      dialogContext.pop();
                      showDialog<void>(
                        context: context,
                        builder: (successContext) => CustomAlertDialog(
                          titleText: 'Başarılı',
                          // ignore: prefer_const_constructors
                          content: Text(
                            '''
Şifre sıfırlama bağlantısı gönderildi
Lütfen e-postanızı ve spam klasörünü konrol edin.''',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: successContext.pop,
                              child: const Text('Kapat'),
                            )
                          ],
                        ),
                      );
                    }).onError(
                      (error, _) {
                        Globals.errorBottomSheet(context, error);
                        return null;
                      },
                    );
                  },
                  child: const Text('Onayla'),
                ),
                OutlinedButton(
                  onPressed: dialogContext.pop,
                  child: const Text('Vazgeç'),
                )
              ],
            ),
          )
        : Globals.errorBottomSheet(context, 'Geçerli Bir Email Giriniz');
  }

  Future<void> signIn(BuildContext context) async {
    await context
        .loading(
      AuthController().signIn(
        context,
        emailController.text,
        passwordController.text,
      ),
    )
        .then((value) {
      if (value != null) {
        context.pushNamedAndRemoveAll('/home');
      }
    }).onError(
      (error, stackTrace) {
        Globals.errorBottomSheet(context, error);
        return null;
      },
    );
  }

  Future<void> registerFunction(
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) async {
    final puan = double.tryParse(scoreController.text);
    final sira = int.tryParse(rankController.text);
    if ((formKey.currentState?.validate() ?? false) &&
        puan != null &&
        sira != null &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        sehirController.text.isNotEmpty) {
      await context
          .loading(
            authController.register(
              context,
              email: emailController.text,
              password: passwordController.text,
              name: nameController.text,
              puan: puan,
              sehir: sehirController.text,
              sira: sira,
            ),
          )
          .onError(
            (error, stackTrace) => Globals.errorBottomSheet(context, error),
          );
    } else {}
  }
}
