part of '../theme.dart';

class CustomInputDecoration extends InputDecorationTheme {
  CustomInputDecoration(this.scheme)
      : super(
          isDense: true,
          contentPadding: const EdgeInsets.only(top: 4, left: 16, bottom: 4),
          constraints: const BoxConstraints(minHeight: 30, maxHeight: 120),
          enabledBorder: underlineInputBorder(scheme.primary),
          focusedBorder: outlineInputBorder(scheme.primary),
          disabledBorder: outlineInputBorder(scheme.inverseSurface),
          errorBorder: outlineInputBorder(scheme.error),
          focusedErrorBorder: outlineInputBorder(scheme.error),
          prefixIconColor: scheme.primary,
          suffixIconColor: scheme.primary,
          labelStyle: TextStyle(color: scheme.primary),
          hintStyle: TextStyle(color: scheme.primary),
          floatingLabelStyle: TextStyle(
            color: scheme.primary,
            fontSize: 20,
          ),
          //focusColor: scheme.primary,
          alignLabelWithHint: false,
          isCollapsed: false,
        );
  final ColorScheme scheme;
  static const double circular = 10;

  static BorderRadius borderRadius =
      const BorderRadius.all(Radius.circular(circular));

  static OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: color,
        width: 3,
      ),
    );
  }

  static UnderlineInputBorder underlineInputBorder(Color color) {
    return UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: color,
        width: 5,
      ),
    );
  }
}
