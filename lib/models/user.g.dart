// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String?,
      email: json['email'] as String,
      name: json['name'] as String,
      sehir: json['sehir'] as String,
      kazanilan: json['kazanilan'] as String?,
      puan: (json['puan'] as num?)?.toDouble() ?? 30.0,
      sira: json['sira'] as int? ?? 3000,
      tercihList: (json['tercihler'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'sehir': instance.sehir,
      'kazanilan': instance.kazanilan,
      'puan': instance.puan,
      'sira': instance.sira,
    };
