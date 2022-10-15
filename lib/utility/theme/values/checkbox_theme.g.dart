part of '../theme.dart';

class CustomCheckBoxTheme extends CheckboxThemeData {
  const CustomCheckBoxTheme({OutlinedBorder? shape = _defaultShape})
      : super(shape: shape ?? _defaultShape);
  static const CircleBorder _defaultShape = CircleBorder();
}
