import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kadro.g.dart';

@JsonSerializable()
class KadroModel extends Equatable {
  const KadroModel({
    required this.siraNo,
    required this.il,
    required this.kurum,
    required this.tur,
    required this.dal,
    required this.sure,
    required this.kontenjan,
    required this.kadroId,
    this.basvurabilenIller,
    this.kazananlar,
    this.tercihEdenler,
  });
  factory KadroModel.fromJson({required Map<String, dynamic> map}) =>
      _$KadroModelFromJson(map);
  final int siraNo;
  final String il;
  final String kurum;
  final String tur;
  final String? dal;
  final String? sure;
  final int kontenjan;
  final String kadroId;
  final List<String?>? basvurabilenIller;
  final List<String?>? kazananlar;
  final List<String?>? tercihEdenler;

  // {
  //   return KadroModel(
  //       siraNo: map['Sıra No'],
  //       il: map['İl'],
  //       kurum: map['Kurum'],
  //       tur: map['Tür'],
  //       dal: map['Dal'],
  //       sure: map['Süre'],
  //       kontenjan: map['Kontenjan'],
  //       kadroId: map['uid'],
  //       kazananlar: map['kazananlar'],
  //       tercihEdenler: map['tercihEdenler']);
  // }

  // Map<String, dynamic> toJson({required Map<String, dynamic> map}) {
  //   return {
  //     "Sıra No": siraNo,
  //     "İl": il,
  // "Kurum":kurum,
  // "Tür" : tur,
  // "Dal" : dal,
  // "Süre" : sure,
  // "Kontenjan" : kontenjani
  // "KadroId" kadroId;
  // final List<String>? basvurabilenIller;
  // final List<UserModel>? kazananlar;
  //   };
  // }

  @override
  List<Object?> get props => [kurum, siraNo, kadroId];
}
