import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

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
  //     {
  //   tercihValueList.value = tercihList ?? <String>[];
  //   tercihValueList.notifyListeners();
  // }

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

  Future<void> tercihGonder() async {
    if (uid != null) {
      await FirebaseDatabase.instance
          .ref('users')
          .child(uid!)
          .child('tercihler')
          .set(tercihList);
    }
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
