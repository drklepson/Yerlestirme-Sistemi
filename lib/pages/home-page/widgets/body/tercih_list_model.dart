import 'package:flutter/foundation.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/models/kadro.dart';

class TercihListModel extends ChangeNotifier
    implements ValueListenable<List<String?>> {
  TercihListModel() {
    tercihValueList = AuthController.to.firestoreUser?.tercihList ?? [];
  }

  List<String?> tercihValueList = [];

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
    AuthController.to.firestoreUser?.tercihList = tercihValueList;
    await AuthController.to.firestoreUser?.tercihGonder();
    notifyListeners();
  }

  @override
  List<String?> get value => tercihValueList;
}
