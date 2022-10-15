part of '../validator.dart';

String? _$siralamaValid(String? value) {
  const pattern = r'^[1-9][0-9]{0,3}$';
  return CustomValidator._regExpReturn(
    pattern: pattern,
    value: value,
    trWords: 'Sıralamanız Hatalıdır',
  );
}
