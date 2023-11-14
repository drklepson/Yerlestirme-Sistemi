part of '../theme.dart';

class _CustomCheckBoxTheme extends CheckboxThemeData {
  _CustomCheckBoxTheme({OutlinedBorder? shape})
      : super(
          shape: shape ?? _rounded,
          overlayColor: MaterialStateProperty.all(
            CustomColors.smuddyGreenGreen700,
          ),
          side: const BorderSide(
            color: CustomColors.smuddyGreenGreen700,
            width: 2,
          ),
        );

  static const _rounded = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  );
}
