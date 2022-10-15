part of '../validator.dart';

String? _$date(String? value) {
  if (value == null || value == '') return null;

  final newValue = value.split('.').reversed.join('-');
  final sonuc = DateTime.tryParse(newValue);
  return sonuc == null ? 'Lütfen geçerli bir tarih giriniz.' : null;
}
