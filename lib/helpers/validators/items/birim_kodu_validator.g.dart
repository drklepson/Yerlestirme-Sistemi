part of '../validator.dart';

String? _$birimKodu(String? value) {
  const pattern = r'^[3][4]\.[0-9]{1,3}\.+[0-9]{1,3}$';
  return CustomValidator._regExpReturn(
    pattern: pattern,
    value: value,
    trWords: 'Birim kodunuz 34.***.*** şeklinde olmalıdır.',
  );
}
