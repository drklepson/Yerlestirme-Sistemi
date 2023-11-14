part of '../theme.dart';

class _CustomSnackbarTheme extends SnackBarThemeData {
  const _CustomSnackbarTheme()
      : super(
          elevation: 3,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(),
        );
}
