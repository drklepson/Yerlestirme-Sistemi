part of '../validator.dart';

String? _$password(String? value) {
  // const pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
  const pattern = r'^.{6,}$';
  const error = '''
Şifreniz en az 6 haneli olmalıdır.''';
  return CustomValidator._regExpReturn(
    pattern: pattern,
    value: value,
    trWords: error,
  );
}
