import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:turkish/turkish.dart';
import 'package:yerlestirme_update/controllers/router/route_controller.dart';
import 'package:yerlestirme_update/models/user.dart';

class AuthService {
  static FirebaseAuth get _auth => FirebaseAuth.instance;

  static Future<User?> signIn(String email, String password) async {
    try {
      return _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then<User?>((value) => value.user);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signOut() => _auth.signOut();

  static Future<UserCredential> createUser(String email, String password) =>
      _auth.createUserWithEmailAndPassword(email: email, password: password);

  static Future<void> register({
    required String email,
    required String password,
    required String name,
    required String sehir,
    required double puan,
    required int sira,
  }) async {
    try {
      final userData = await createUser(email, password).then((r) => r.user);
      if (userData == null) throw Exception('Kullanıcı oluşturulamadı');

      final model = UserModel(
        uid: userData.uid,
        email: email,
        name: name,
        sehir: turkish.toUpperCase(sehir),
        puan: puan,
        sira: sira,
      );

      await model.createOnDb();
      PagesEnum.home.go();
    } catch (e) {
      rethrow;
    }
  }
}
