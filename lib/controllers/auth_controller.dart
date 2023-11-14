// import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
// import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/models/user.dart';
import 'package:yerlestirme_update/service/auth_service.dart';
import 'package:yerlestirme_update/service/data_service.dart';
import 'package:yerlestirme_update/service/kadro_service.dart';

class AuthController extends ChangeNotifier {
  AuthController() {
    authState.listen((userEvent) async {
      firebaseUser = userEvent;

      if (firebaseUser != null) {
        await _handleAuthChanged(firebaseUser!);

        DataService.streamUser(firebaseUser!).listen((userModelEvent) {
          firestoreUser = userModelEvent;
          notifyListeners();
        });

        await KadroService.futureKadroList(firestoreUser)
            .then((kadroModelValue) {
          return firstKadroList = kadroModelValue;
        });

        KadroService.streamKadroList(firestoreUser).listen((kadroModelEvent) {
          firstKadroList = kadroModelEvent;
        });
      }

      notifyListeners();
    });
  }
  // static AuthController? _controller;

  Future<bool> firstInit() async {
    try {
      firebaseUser = await _auth.authStateChanges().first;
      if (firebaseUser != null) {
        await _handleAuthChanged(firebaseUser!);
        await KadroService.futureKadroList(firestoreUser)
            .then((value) => firstKadroList = value);
      }
      initialized = true;
      return true;
    } catch (e) {
      initialized = false;
      return false;
    }
  }

  bool initialized = false;
  FirebaseAuth get _auth => FirebaseAuth.instance;

  User? firebaseUser;
  UserModel? firestoreUser;
  bool get isLogin => firebaseUser != null;

  List<KadroModel>? firstKadroList;

  User? get getUser => _auth.currentUser;

  Stream<User?> get authState => _auth.authStateChanges();

  Future<bool> signIn(String email, String password) async {
    final cacheUser = await AuthService.signIn(email, password);
    firebaseUser = cacheUser;
    if (firebaseUser != null) await _handleAuthChanged(firebaseUser!);
    notifyListeners();
    return firebaseUser == null;
  }

  Future<void> signOut(BuildContext context) async {
    await AuthService.signOut();
    firebaseUser = null;
    firestoreUser = null;
    notifyListeners();
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String sehir,
    required double puan,
    required int sira,
  }) =>
      AuthService.register(
        email: email,
        password: password,
        name: name,
        sehir: sehir,
        puan: puan,
        sira: sira,
      );

  Future<void> _handleAuthChanged(User firebaseUserLoc) async {
    firebaseUser = firebaseUserLoc;
    firestoreUser = await DataService.futureUser(firebaseUserLoc);
    firstKadroList = await KadroService.futureKadroList(firestoreUser);
  }

  Future<void> resetPassword(String em) =>
      _auth.sendPasswordResetEmail(email: em);
}
