import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kadro.g.dart';

@JsonSerializable()
class KadroModel extends Equatable {
  const KadroModel({
    required this.sira,
    required this.sehir,
    required this.kurum,
    required this.tur,
    required this.kontenjan,
    required this.kadroId,
    this.basvurabilen,
    this.kazananlar,
    this.tercihEdenler,
  });
  factory KadroModel.fromJson({required Map<String, dynamic> map}) =>
      _$KadroModelFromJson(map);
  final int sira;
  final String sehir;
  final String kurum;
  final String tur;
  final int kontenjan;
  final String kadroId;
  final List<String?>? basvurabilen;
  final List<String?>? kazananlar;
  final List<String?>? tercihEdenler;

  @override
  List<Object?> get props => [kurum, sira, kadroId];
}
