import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/pages/auth_page/auth_page_model.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/email_field.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/name_field.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/password_field.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/rank_field.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/score_field.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/form_fields/sehir_field.dart';

const edgeInsets = EdgeInsets.symmetric(vertical: 16, horizontal: 12);
const borderRadius2 = BorderRadius.vertical(bottom: Radius.circular(20));
const boxDecoration =
    BoxDecoration(color: Colors.white, borderRadius: borderRadius2);

class KayitMainWidget extends StatelessWidget {
  KayitMainWidget({required this.model, super.key});
  final AuthPageModel model;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: edgeInsets,
          decoration: boxDecoration,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NameFormField(nameController: model.nameController),
                EmailFormField(emailController: model.emailController),
                SehirFormField(controller: model.sehirController),
                PasswordFormField(
                  passwordController: model.passwordController,
                  onFieldSubmitted: (value) =>
                      model.registerFunction(context, _formKey),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ScoreFormField(
                        scoreController: model.scoreController,
                      ),
                    ),
                    Expanded(
                      child:
                          RankFormField(rankController: model.rankController),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => model.registerFunction(context, _formKey),
                  child: const Text('Kayıt Ol'),
                ),
              ].itemPadding(const EdgeInsets.all(8)),
            ),
          ),
        ),
      ),
    );
  }
}
