import 'package:firebase_database/firebase_database.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/models/user.dart';

class KadroService {
  static FirebaseDatabase get _realDb => FirebaseDatabase.instance;

  static Query _kadroQuery(UserModel? userModel) => _realDb
      .ref('kadrolist')
      .orderByChild('sehir')
      .equalTo(userModel?.sehir ?? 'abcabc');

  static List<KadroModel>? getKadroList(DatabaseEvent event) {
    final mapOfSnap = event.snapshot.value as Map<String, dynamic>?;
    return mapOfSnap?.values
        .map((e) => KadroModel.fromJson(map: e as Map<String, dynamic>))
        .toList();
  }

  static Future<List<KadroModel>?> futureKadroList(UserModel? userModel) =>
      _kadroQuery(userModel).once().then<List<KadroModel>?>(getKadroList);

  static Stream<List<KadroModel>?> streamKadroList(UserModel? userModel) =>
      _kadroQuery(userModel).onValue.map<List<KadroModel>?>(getKadroList);
}
