import 'package:yerlestirme_update/controllers/auth_controller.dart';

class HomePageModel {
  HomePageModel() {
    userExist = authController.firestoreUser != null;
  }

  late final bool userExist;
  final authController = AuthController();
}
