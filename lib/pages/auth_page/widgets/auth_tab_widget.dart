import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';
import 'package:yerlestirme_update/const/default_strings.dart';
import 'package:yerlestirme_update/pages/auth_page/auth_page_model.dart';
import 'package:yerlestirme_update/pages/auth_page/auth_page_screen.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/rank_field.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/score_field.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/sehir_field.dart';

class AuthTabWidget extends StatelessWidget {
  const AuthTabWidget({
    required this.children,
    required this.formKey,
    super.key,
  });

  final List<Widget> children;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: authBoxDecoration,
        padding: CustomInsets.h12v16,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: children),
          ),
        ),
      ),
    );
  }
}

class LoginTabView extends StatelessWidget {
  const LoginTabView({required this.model, super.key});
  final AuthPageModel model;

  @override
  Widget build(BuildContext context) {
    return AuthTabWidget(
      formKey: model.loginFormKey,
      children: [
        EmailFormField(emailController: model.emailController),
        PasswordFormField(
          passwordController: model.passwordController,
          onFieldSubmitted: (value) => model.signIn(),
        ),
        FilledButton(
          onPressed: model.signIn,
          child: const Text(DefaultStrings.login),
        ),
        TextButton(
          onPressed: model.showResetPasswordDialog,
          child: const Text(DefaultStrings.forgotPassword),
        ),
      ],
    );
  }
}

class SignupTabView extends StatelessWidget {
  const SignupTabView({required this.model, super.key});
  final AuthPageModel model;

  @override
  Widget build(BuildContext context) {
    return AuthTabWidget(
      formKey: model.registerFormKey,
      children: [
        NameFormField(nameController: model.nameController),
        EmailFormField(emailController: model.emailController),
        SehirFormField(controller: model.sehirController),
        PasswordFormField(
          passwordController: model.passwordController,
          onFieldSubmitted: (value) => model.registerFunction(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ScoreFormField(
                scoreController: model.scoreController,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: RankFormField(rankController: model.rankController),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: model.registerFunction,
          child: const Text(DefaultStrings.register),
        ),
      ],
    );
  }
}
