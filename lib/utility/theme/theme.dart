import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yerlestirme_update/main.dart';
import 'package:yerlestirme_update/utility/theme/constants/colors.dart';

part 'values/appbar_theme.g.dart';
part 'values/button_theme.g.dart';
part 'values/checkbox_theme.g.dart';
part 'values/input_decoration_theme.g.dart';
part 'values/snackbar_theme.g.dart';
part 'values/bottom_navigation_bar_theme.g.dart';
part 'values/tab_bar_theme.g.dart';
part 'values/bottom_sheet_theme.g.dart';

/// This class is used to create a custom theme for the application.
class CustomThemeData {
  /// This class is used to create a custom theme for the application.
  CustomThemeData();

  static const bool _useMaterial3 = true;

  static ThemeData _data(Brightness brightness) {
    final colorScheme =
        ColorScheme.fromSeed(seedColor: AppInfo.mainColor).copyWith(
      primary: CustomColors.smuddyGreenGreen700,
      error: CustomColors.smuddyEssentialsError,
    );
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: GoogleFonts.rubikTextTheme(),
      scaffoldBackgroundColor: Colors.transparent,
      elevatedButtonTheme: _CustomElevatedButtonTheme(),
      filledButtonTheme: _CustomFilledButtonTheme(),
      textButtonTheme: _CustomTextButtonTheme(),
      tabBarTheme: const _CustomTabBarTheme(),
      outlinedButtonTheme: _CustomOutlinedButtonTheme(colorScheme),
      appBarTheme: _CustomAppbarTheme(colorScheme),
      snackBarTheme: const _CustomSnackbarTheme(),
      bottomSheetTheme: const _CustomBottomSheetTheme(),
      dialogTheme: const DialogTheme(),
      useMaterial3: _useMaterial3,
      checkboxTheme: _CustomCheckBoxTheme(),
      inputDecorationTheme: _CustomInputDecoration(
        colorScheme.copyWith(brightness: brightness),
      ),
      bottomNavigationBarTheme: _CustomBottomNavBarTheme(
        colorScheme: colorScheme.copyWith(brightness: brightness),
      ),
      actionIconTheme: const ActionIconThemeData(),
    );
  }

  static ThemeData get dark => _data(Brightness.dark);
  static ThemeData get ligth => _data(Brightness.light);
}
