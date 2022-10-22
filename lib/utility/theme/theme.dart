import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';

part 'values/appbar_theme.g.dart';
part 'values/button_theme.g.dart';
part 'values/checkbox_theme.g.dart';
part 'values/input_decoration_theme.g.dart';

class CustomThemeData {
  static ThemeData themeData(Color color, Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: color.createMaterialColor,
      brightness: brightness,
    );
    return ThemeData(
      fontFamily: 'BalooBhai',
      elevatedButtonTheme: CustomElevatedButtonTheme(colorScheme),
      textButtonTheme: const CustomTextButtonTheme(),
      appBarTheme: CustomAppbarTheme(colorScheme),
      useMaterial3: true,
      checkboxTheme: const CustomCheckBoxTheme(),
      inputDecorationTheme:
          CustomInputDecoration(colorScheme.copyWith(brightness: brightness)),
      colorScheme: colorScheme,
    );
  }

  static ThemeData darkTheme(Color color) => themeData(color, Brightness.dark);
  static ThemeData ligthTheme(Color color) =>
      themeData(color, Brightness.light);
}
