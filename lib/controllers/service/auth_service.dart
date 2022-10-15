import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/extensions/context_extension.g.dart';

class AuthService {
  AuthService() {
    _auth = FirebaseAuth.instance;
  }
  late final FirebaseAuth _auth;

  Future<User?> signIn(
    BuildContext context,
    String email,
    String password,
  ) async =>
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then<User?>((value) => value.user)
          .onError((error, stackTrace) {
        print(error);
        return null;
      });

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut().then(
          (_) => context.pushNamedAndRemoveAll('/auth'),
        );
  }
}
