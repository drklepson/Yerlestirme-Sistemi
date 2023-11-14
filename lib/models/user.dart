import 'package:json_annotation/json_annotation.dart';
import 'package:yerlestirme_update/service/data_service.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.email,
    required this.name,
    required this.sehir,
    this.uid,
    this.kazanilan,
    this.puan = 30.00,
    this.sira = 3000,
    this.tercihList,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) =>
      _$UserModelFromJson(map);

  String? uid;
  final String email;
  final String name;
  final String sehir;
  final String? kazanilan;
  final double puan;
  final int sira;
  List<String?>? tercihList;

  Future<void> sendTercih() => DataService.sendTercih(this);

  Future<void> createOnDb() => DataService.createUser(this);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
