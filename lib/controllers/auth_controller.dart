// import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
// import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/service/auth_service.dart';
import 'package:yerlestirme_update/controllers/service/data_service.dart';
import 'package:yerlestirme_update/controllers/service/kadro_service.dart';
import 'package:yerlestirme_update/controllers/service/register_service.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/models/user.dart';

class AuthController extends ChangeNotifier
    implements ValueListenable<AuthController> {
  factory AuthController() {
    if (_controller != null) return _controller!;
    _controller = AuthController._init();
    return _controller!;
  }

  AuthController._init() {
    _auth = FirebaseAuth.instance;
    _registerService = RegisterService();
    _authService = AuthService();
    _kadroService = KadroService();
    _dataService = DataService();

    authState.listen((userEvent) async {
      firebaseUser = userEvent;
      if (firebaseUser != null) {
        await handleAuthChanged(firebaseUser!);

        _dataService.streamUser(firebaseUser!).listen((userModelEvent) {
          firestoreUser = userModelEvent;
          notifyListeners();
        });

        await _kadroService
            .futureKadroList(firestoreUser)
            .then((kadroModelValue) {
          return firstKadroList = kadroModelValue;
        });

        _kadroService.streamKadrList(firestoreUser).listen((kadroModelEvent) {
          firstKadroList = kadroModelEvent;
        });
      }
      notifyListeners();
    });
  }
  static AuthController? _controller;

  Future<bool> firstInit() async {
    try {
      firebaseUser = await _auth.authStateChanges().first;
      if (firebaseUser != null) {
        await handleAuthChanged(firebaseUser!);
        await _kadroService
            .futureKadroList(firestoreUser)
            .then((value) => firstKadroList = value);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  late final FirebaseAuth _auth;
  late final AuthService _authService;
  late final RegisterService _registerService;
  late final KadroService _kadroService;
  late final DataService _dataService;

  User? firebaseUser;
  UserModel? firestoreUser;

  List<KadroModel>? firstKadroList;

  User? get getUser => _auth.currentUser;

  Stream<User?> get authState => _auth.authStateChanges();

  Future<bool> signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    return _authService
        .signIn(context, email, password)
        .then<bool>((value) async {
      firebaseUser = value;
      if (firebaseUser != null) await handleAuthChanged(firebaseUser!);
      notifyListeners();
      return firebaseUser == null;
    });
  }

  Future<void> signOut(BuildContext context) async {
    await _authService.signOut(context).then((value) {
      firebaseUser = null;
      firestoreUser = null;
      notifyListeners();
    });
  }

  Future<void> register(
    BuildContext context, {
    required String email,
    required String password,
    required String name,
    required String sehir,
    required double puan,
    required int sira,
  }) =>
      _registerService.register(
        context,
        email: email,
        password: password,
        name: name,
        sehir: sehir,
        puan: puan,
        sira: sira,
      );

  Future<void> handleAuthChanged(User firebaseUserLoc) async {
    firebaseUser = firebaseUserLoc;
    firestoreUser = await _dataService.futureUser(firebaseUserLoc);
    firstKadroList = await _kadroService.futureKadroList(firestoreUser);
  }

  Future<void> resetPassword(String em) =>
      _auth.sendPasswordResetEmail(email: em);

  Future<UserModel?> getUserWithID(String userID) =>
      _dataService.getUserWithID(userID);

  @override
  AuthController get value => AuthController();
}
