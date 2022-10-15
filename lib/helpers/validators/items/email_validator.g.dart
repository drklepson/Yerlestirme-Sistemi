part of '../validator.dart';

String? _$email(String? value) {
  const pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  return CustomValidator._regExpReturn(
    pattern: pattern,
    value: value,
    trWords: 'E-mail hatalı.',
  );
}
