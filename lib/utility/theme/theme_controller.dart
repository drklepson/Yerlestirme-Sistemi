import 'package:flutter/material.dart';
import 'package:yerlestirme_update/utility/theme/theme.dart';

/// This class is use to provide the theme to the application.
final class ThemeProvider extends ChangeNotifier {
  /// This class is use to provide the theme to the application.
  ThemeProvider();

  Brightness _brightness = Brightness.light;

  /// You can use this function to get
  /// the current brightness of the application.
  Brightness get brightness => _brightness;

  /// You can use this function to set the brightness of the application.
  set brightness(Brightness value) {
    _brightness = value;
    notifyListeners();
  }

  /// You can change the brightness of the application.
  /// If the brightness is dark then it will change to light
  /// and if the brightness is light then it will change to dark.
  void get changeBrightness {
    _brightness =
        _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    notifyListeners();
  }

  /// You can use this function to get the theme of the application.
  ThemeData get theme {
    switch (brightness) {
      case Brightness.dark:
        return CustomThemeData.dark;
      case Brightness.light:
        return CustomThemeData.ligth;
    }
  }
}
