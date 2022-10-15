part of '../theme.dart';

class CustomElevatedButtonTheme extends ElevatedButtonThemeData {
  CustomElevatedButtonTheme(ColorScheme colorScheme)
      : super(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(colorScheme.primary),
            foregroundColor: MaterialStatePropertyAll(colorScheme.onPrimary),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        );
}

class CustomTextButtonTheme extends TextButtonThemeData {
  const CustomTextButtonTheme()
      : super(
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        );
}
