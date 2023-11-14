import 'package:drklepson_utility_package/tools/dialog_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/controllers/router/route_controller.dart';
import 'package:yerlestirme_update/firebase_options.dart';
import 'package:yerlestirme_update/utility/theme/constants/colors.dart';
import 'package:yerlestirme_update/utility/theme/theme_controller.dart';

class AppInfo {
  static const String appName = 'Sahu Yerleştirme Uygulaması';
  static const Color mainColor = CustomColors.smuddyGreenGreen700;
  static const String packageName = 'me.carda.awesome_notifications';
  static const String version = '0.0.1';
  static const String buildNumber = '1';
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static ScaffoldMessengerState get scaffoldMessenger =>
      scaffoldMessengerKey.currentState!;

  static FToast get fToast => FToast()..init(navigatorKey.currentContext!);
}

void main() async {
  // ignore: prefer_const_constructors
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DialogManager.init(AppInfo.navigatorKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, child) => MaterialApp.router(
        title: AppInfo.appName,
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        routerConfig: RouterController.routerConfig,
        scaffoldMessengerKey: AppInfo.scaffoldMessengerKey,
        theme: context.watch<ThemeProvider>().theme,
      ),
    );
  }
}
