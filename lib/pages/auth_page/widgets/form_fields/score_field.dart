import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/formatters/formatter.dart';
import 'package:yerlestirme_update/helpers/validators/validator.dart';

class ScoreFormField extends StatelessWidget {
  const ScoreFormField({required this.scoreController, super.key});

  final TextEditingController scoreController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'A Puanı',
        prefixIcon: Icon(Icons.font_download_outlined),
      ),
      inputFormatters: [CustomFormatters.aPuani],
      validator: CustomValidator.aPuani,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: scoreController,
    );
  }
}
