import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/validators/validator.dart';

class PasswordFormField extends StatelessWidget {
  PasswordFormField({
    super.key,
    required TextEditingController passwordController,
    required this.onFieldSubmitted,
  }) : _passwordController = passwordController;

  final obscuringCharacter2 = '✲';

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);
  final TextEditingController _passwordController;

  final dynamic Function(String value) onFieldSubmitted;

  void changeObscure() {
    _isObscure.value = !_isObscure.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isObscure,
      builder: (context, value, child) {
        return TextFormField(
          controller: _passwordController,
          validator: CustomValidator.password,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: onFieldSubmitted,
          obscuringCharacter: obscuringCharacter2,
          decoration: InputDecoration(
            labelText: 'Şifre',
            prefixIcon: const Icon(Icons.lock_outlined),
            suffixIcon: IconButton(
              icon: Icon(value ? Icons.visibility : Icons.visibility_off),
              onPressed: changeObscure,
            ),
          ),
          obscureText: _isObscure.value,
        );
      },
    );
  }
}
