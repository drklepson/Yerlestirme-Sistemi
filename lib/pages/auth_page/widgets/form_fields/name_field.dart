import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/validators/validator.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      validator: CustomValidator.name,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Ad Soyad',
        prefixIcon: Icon(Icons.abc_outlined),
      ),
    );
  }
}
