import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:yerlestirme_update/models/user.dart';

class DataService {
  static FirebaseDatabase get _realDb => FirebaseDatabase.instance;

  static Future<void> createUser(UserModel user) async {
    if (user.uid == null) return;
    await _realDb.ref('/users/${user.uid}').set(user.toJson());
  }

  static Future<UserModel?> getUserWithID(String userID) async =>
      _realDb.ref('users/$userID').once().then(eventToUserModel);

  static Stream<UserModel?> streamUser(User user) =>
      _realDb.ref('/users/${user.uid}').onValue.map(eventToUserModel);

  static Future<UserModel?> futureUser(User user) => getUserWithID(user.uid);

  static UserModel? eventToUserModel(DatabaseEvent event) {
    final data = event.snapshot.value;
    if (data == null) return null;
    return UserModel.fromJson(data as Map<String, dynamic>);
  }

  static Future<void> sendTercih(UserModel user) async {
    if (user.uid == null) return;
    final dbUrl = 'users/${user.uid}/tercihler';
    return _realDb.ref(dbUrl).set(user.tercihList);
  }
}
