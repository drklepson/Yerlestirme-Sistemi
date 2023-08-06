import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/pages/auth_page/auth_page_model.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/email_field.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/password_field.dart';

const borderRadius2 = BorderRadius.vertical(bottom: Radius.circular(20));
const String girisBaslikText = 'Giriş Yap';

class GirisMainWidget extends StatelessWidget {
  GirisMainWidget({required this.model, super.key});
  final AuthPageModel model;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(vertical: 16, horizontal: 12);
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: borderRadius2,
        ),
        padding: edgeInsets,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EmailFormField(emailController: model.emailController),
              PasswordFormField(
                passwordController: model.passwordController,
                onFieldSubmitted: (value) => model.signIn(context),
              ),
              ElevatedButton(
                onPressed: () => model.signIn(context),
                child: const Text(
                  'Giriş Yap',
                  maxLines: 1,
                ),
              ),
              TextButton(
                onPressed: () => model.showResetPasswordDialog(context),
                child: const Text('Şifremi Unuttum'),
              )
            ].itemPadding(const EdgeInsets.all(8)),
          ),
        ),
      ),
    );
  }
}
