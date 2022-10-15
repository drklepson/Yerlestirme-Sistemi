part of '../validator.dart';

String? _$aPuaniValid(String? value) {
  const pattern = r'^[1-8][0-9].[0-9]{1,2}$';
  const error = 'Puan: 34.21 (**.**)';
  if (double.tryParse(value ?? 'abc') != null) {
    return CustomValidator._regExpReturn(
      pattern: pattern,
      value: value,
      trWords: error,
    );
  } else {
    return 'Puanınızı kontrol ediniz';
  }
}
