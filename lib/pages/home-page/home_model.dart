import 'package:flutter/foundation.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/models/kadro.dart';

class HomePageModel extends ChangeNotifier {
  HomePageModel() {
    tercihValueList = AuthController().firestoreUser?.tercihList ?? [];
  }

  List<String?> tercihValueList = [];

  KadroModel? seciliKadro;
  bool get kadroUyari => tercihValueList.contains(seciliKadro?.kadroId);

  void seciliKadroDegistir(KadroModel model) {
    seciliKadro = model;
    notifyListeners();
  }

  void seciliKadroSil() {
    seciliKadro = null;
    notifyListeners();
  }

  void tercihEkleBtnFn() {
    if (seciliKadro != null) tercihEkle(seciliKadro!);
  }

  Future<void> tercihEkle(KadroModel kadro) async {
    if (tercihValueList.contains(kadro.kadroId)) return;
    final kadroId = kadro.kadroId;

    tercihValueList.add(kadroId);
    await saveAndNotiy();
  }

  Future<void> tercihSilme(int index) async {
    tercihValueList.removeAt(index);
    await saveAndNotiy();
  }

  Future<void> tercihReorder(int oldindex, int newindex) async {
    var newIndexVal = newindex;
    if (newindex > oldindex) newIndexVal -= 1;

    final changedItem = tercihValueList.removeAt(oldindex);
    tercihValueList.insert(newIndexVal, changedItem);
    await saveAndNotiy();
  }

  Future<void> saveAndNotiy() async {
    AuthController().firestoreUser?.tercihList = tercihValueList;
    await AuthController().firestoreUser?.sendTercih();
    notifyListeners();
  }
}
