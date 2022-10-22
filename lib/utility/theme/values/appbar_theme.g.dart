// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

part of '../theme.dart';

class CustomAppbarTheme extends AppBarTheme {
  CustomAppbarTheme(ColorScheme colorScheme)
      : super(
          color: colorScheme.primary,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            // fontFamily: GoogleFonts.balooBhai2().fontFamily,
            color: colorScheme.onPrimary,
          ),
          iconTheme:
              IconThemeData(size: 28, color: colorScheme.onPrimaryContainer),
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
