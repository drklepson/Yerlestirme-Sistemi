import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:turkish/turkish.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/models/user.dart';

class RegisterService {
  RegisterService() {
    _realDb = FirebaseDatabase.instance;
    _auth = FirebaseAuth.instance;
  }

  late final FirebaseAuth _auth;
  late final FirebaseDatabase _realDb;

  Future<void> register(
    BuildContext context, {
    required String email,
    required String password,
    required String name,
    required String sehir,
    required double puan,
    required int sira,
  }) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) async {
        final userData = result.user;
        if (userData != null) {
          await _createUserRealDatabase(
            UserModel(
              uid: userData.uid,
              email: email,
              name: name,
              sehir: turkish.toUpperCase(sehir),
              puan: puan,
              sira: sira,
            ),
            result.user!,
          ).whenComplete(() => context.pushNamedAndRemoveAll('/home'));
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _createUserRealDatabase(
    UserModel user,
    User firebaseUserLoc,
  ) async {
    await _realDb.ref('/users/${firebaseUserLoc.uid}').set(user.toJson());
  }
}
