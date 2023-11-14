import 'package:drklepson_utility_package/validators/validator.dart';
import 'package:flutter/material.dart';

class RankFormField extends StatelessWidget {
  const RankFormField({required this.rankController, super.key});

  final TextEditingController rankController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Sıralama',
        prefixIcon: Icon(Icons.looks_two_outlined),
      ),
      validator: (value) => CustomValidator.number(
        value,
        min: 1,
        max: 2281,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: rankController,
    );
  }
}
