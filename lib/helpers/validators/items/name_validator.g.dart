part of '../validator.dart';

String? _$name(String? value) {
  const pattern = r'^[a-zA-Z0-9ğüşöçıİĞÜŞÖÇ. ]{2,}$';
  return CustomValidator._regExpReturn(
    pattern: pattern,
    value: value,
    trWords: 'Geçerli bir isim giriniz.',
  );
}
