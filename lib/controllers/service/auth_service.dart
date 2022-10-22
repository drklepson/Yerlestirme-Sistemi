import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService() {
    _auth = FirebaseAuth.instance;
  }
  late final FirebaseAuth _auth;

  Future<User?> signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      return _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then<User?>((value) => value.user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut(BuildContext context) => _auth.signOut();
}
