part of '../theme.dart';

const _padding = MaterialStatePropertyAll(
  EdgeInsets.symmetric(vertical: 15.5, horizontal: 40),
);

const _textStyle = MaterialStatePropertyAll(
  TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
);

final _buttonStyle = ButtonStyle(
  padding: _padding,
  textStyle: _textStyle,
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  minimumSize: const MaterialStatePropertyAll(Size(160, 48)),
);

class _CustomElevatedButtonTheme extends ElevatedButtonThemeData {
  _CustomElevatedButtonTheme() : super(style: _buttonStyle);
}

class _CustomTextButtonTheme extends TextButtonThemeData {
  _CustomTextButtonTheme()
      : super(
          style: _buttonStyle.copyWith(
            textStyle: MaterialStatePropertyAll(
              _textStyle.value.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
}

class _CustomFilledButtonTheme extends FilledButtonThemeData {
  _CustomFilledButtonTheme()
      : super(
          style: _buttonStyle.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled)
                  ? const Color(0xffCBD2CF)
                  : CustomColors.smuddyGreenGreen700,
            ),
            foregroundColor: const MaterialStatePropertyAll(
              CustomColors.smuddyLightLight50,
            ),
          ),
        );
}

class _CustomOutlinedButtonTheme extends OutlinedButtonThemeData {
  _CustomOutlinedButtonTheme(ColorScheme scheme)
      : super(
          style: _buttonStyle.copyWith(
            side: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled)
                  ? const BorderSide(color: Color(0x61191c1a))
                  : BorderSide(color: scheme.primary),
            ),
          ),
        );
}
