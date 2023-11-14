import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';

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
      inputFormatters: [CustomFormatters.score],
      validator: (value) => CustomValidator.number(
        value,
        min: 30,
        max: 85,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: scoreController,
    );
  }
}
