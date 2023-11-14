part of '../theme.dart';

class _CustomInputDecoration extends InputDecorationTheme {
  _CustomInputDecoration(this.scheme)
      : super(
          isDense: true,
          isCollapsed: true,
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 8,
          ),
          constraints: const BoxConstraints(
            minHeight: 56,
            maxHeight: 120,
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 10,
            height: 1.5,
          ),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            height: 1.5,
          ),
          labelStyle: MaterialStateTextStyle.resolveWith(
            (states) => TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              height: 1.5,
              color: states.contains(MaterialState.error)
                  ? CustomColors.smuddyEssentialsError
                  : CustomColors.smuddyLightLight800,
            ),
          ),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
            (states) => TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              height: 1.5,
              color: states.contains(MaterialState.error)
                  ? CustomColors.smuddyEssentialsError
                  : CustomColors.smuddyLightLight700,
            ),
          ),
        );

  /// This class is used to create a custom theme for the application.
  final ColorScheme scheme;

  // /// This class is used to create a custom theme for the application.
  // static const double circular = 8;

  // /// This class is used to create a custom theme for the application.
  // static BorderRadius borderRadius =
  //     const BorderRadius.all(Radius.circular(circular));

  // /// This class is used to create a custom theme for the application.
  // static OutlineInputBorder outlineInputBorder(Color color) {
  //   return OutlineInputBorder(
  //     borderRadius: borderRadius,
  //     borderSide: BorderSide(
  //       color: color,
  //       width: 3,
  //     ),
  //   );
  // }

  // /// This class is used to create a custom theme for the application.
  // static UnderlineInputBorder underlineInputBorder(Color color) {
  //   return UnderlineInputBorder(
  //     borderRadius: borderRadius,
  //     borderSide: BorderSide(
  //       color: color,
  //       width: 5,
  //       strokeAlign: 2,
  //     ),
  //   );
  // }
}
