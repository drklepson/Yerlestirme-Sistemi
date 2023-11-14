part of '../theme.dart';

class _CustomBottomNavBarTheme extends BottomNavigationBarThemeData {
  _CustomBottomNavBarTheme({Color? backgroundColor, ColorScheme? colorScheme})
      : super(
          backgroundColor: backgroundColor ?? colorScheme?.background,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedIconTheme: const IconThemeData(size: 24),
          unselectedIconTheme: const IconThemeData(size: 24),
        );
}
