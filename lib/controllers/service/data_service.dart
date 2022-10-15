import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:yerlestirme_update/models/user.dart';

class DataService {
  DataService() {
    _realDb = FirebaseDatabase.instance;
  }

  late final FirebaseDatabase _realDb;

  Future<UserModel?> getUserWithID(String userID) async {
    final deneme = await _realDb.ref('users/$userID').once();
    final defMap = deneme.snapshot.value as Map<String, dynamic>?;
    if (defMap != null) {
      final gelenUser = UserModel.fromJson(defMap);
      return gelenUser;
    }
    return null;
  }

  Stream<UserModel?> streamUser(User user) =>
      _realDb.ref('/users/${user.uid}').onValue.map(
        (event) {
          final data = event.snapshot.value;
          if (data != null) {
            return UserModel.fromJson(data as Map<String, dynamic>);
          }
          return null;
        },
      );

  Future<UserModel?> futureUser(User user) =>
      _realDb.ref('/users/${user.uid}').once().then<UserModel?>(
        (event) {
          final data = event.snapshot.value;
          if (data != null) {
            return UserModel.fromJson(data as Map<String, dynamic>);
          }
          return null;
        },
      );
}
