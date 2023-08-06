// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: eol_at_end_of_file

part of 'kadro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KadroModel _$KadroModelFromJson(Map<String, dynamic> json) => KadroModel(
      sehir: json['sehir'] as String,
      kurum: json['kurum'] as String,
      kontenjan: json['kontenjan'] as int,
      kadroId: json['uid'] as String,
      basvurabilen: (json['basvurabilen'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      kazananlar: (json['kazananlar'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      tercihEdenler: (json['tercihEdenler'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );
