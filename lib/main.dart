import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:yerlestirme_update/const/default_strings.dart';
import 'package:yerlestirme_update/firebase_options.dart';
import 'package:yerlestirme_update/pages/auth_page/auth_page_screen.dart';
import 'package:yerlestirme_update/pages/home-page/home_page.dart';
import 'package:yerlestirme_update/splash_page.dart';
import 'package:yerlestirme_update/utility/theme/theme.dart';

Color themeMainColor = const Color.fromARGB(160, 34, 116, 132);

void main() async {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: DefaultStrings.appTitle,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/auth': (context) => const AuthPageScreen()
      },
      themeMode: ThemeMode.light,
      theme: CustomThemeData.ligthTheme(themeMainColor),
      darkTheme: CustomThemeData.darkTheme(themeMainColor),
    );
  }
}
