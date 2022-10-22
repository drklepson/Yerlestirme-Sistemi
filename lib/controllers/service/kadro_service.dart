import 'package:firebase_database/firebase_database.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/models/user.dart';

class KadroService {
  KadroService() {
    _realDb = FirebaseDatabase.instance;
    // _auth = FirebaseAuth.instance;
  }

  // late final FirebaseAuth _auth;
  late final FirebaseDatabase _realDb;

  Query kadroQuery(UserModel? userModel) => _realDb
      .ref('kadrolist')
      .orderByChild('sehir')
      .equalTo(userModel?.sehir ?? 'abcabc');

  List<KadroModel>? getKadroList(DatabaseEvent event) {
    final mapOfSnap = event.snapshot.value as Map<String, dynamic>?;
    mapOfSnap?.map<String, Map<String, dynamic>>(
      (key, value) => MapEntry(key, value as Map<String, dynamic>),
    );
    return mapOfSnap?.values
        .map((e) => KadroModel.fromJson(map: e as Map<String, dynamic>))
        .toList();
  }

  Future<List<KadroModel>?> futureKadroList(UserModel? userModel) =>
      kadroQuery(userModel).once().then<List<KadroModel>?>(getKadroList);

  Stream<List<KadroModel>?> streamKadrList(UserModel? userModel) =>
      kadroQuery(userModel).onValue.map<List<KadroModel>?>(getKadroList);
}
