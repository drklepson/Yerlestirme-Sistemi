// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: eol_at_end_of_file

part of 'kadro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KadroModel _$KadroModelFromJson(Map<String, dynamic> json) => KadroModel(
      siraNo: json['Sıra No'] as int,
      il: json['İl'] as String,
      kurum: json['Kurum'] as String,
      tur: json['Tür'] as String,
      dal: json['Dal'] as String?,
      sure: json['Süre'] as String?,
      kontenjan: json['Kontenjan'] as int,
      kadroId: json['uid'] as String,
      basvurabilenIller: (json['Başvurabilenler'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      kazananlar: (json['kazananlar'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      tercihEdenler: (json['tercihEdenler'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );
