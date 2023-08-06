import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/validators/validator.dart';

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
      validator: CustomValidator.siralama,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: rankController,
    );
  }
}
