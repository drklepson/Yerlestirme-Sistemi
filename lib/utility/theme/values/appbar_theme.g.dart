part of '../theme.dart';

class _CustomAppbarTheme extends AppBarTheme {
  _CustomAppbarTheme(ColorScheme colorScheme)
      : super(
          color: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: colorScheme.primary,
          ),
          titleSpacing: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarContrastEnforced: true,
            statusBarBrightness: colorScheme.brightness,
            statusBarIconBrightness: colorScheme.brightness != Brightness.dark
                ? Brightness.dark
                : Brightness.light,
            systemNavigationBarColor: colorScheme.primary,
          ),
        );
}
