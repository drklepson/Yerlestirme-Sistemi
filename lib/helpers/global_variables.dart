import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yerlestirme_update/utility/widgets/circuler_prog_ind.dart';

class Globals {
  static const Duration durationLow = Duration(seconds: 1);
  static const Duration durationMid = Duration(seconds: 2);
  static const Duration durationLong = Duration(seconds: 3);

  static const Color semiTransparent = Colors.white24;

  static List<Shadow> listShadow({int? power}) => List.generate(
        power ?? 5,
        (index) => const Shadow(color: Colors.white, blurRadius: 5),
      );

  static List<BoxShadow> listBoxShadow({int? power}) => List.generate(
        power ?? 5,
        (index) => const BoxShadow(color: Colors.white, blurRadius: 2),
      );

  static final List<TextStyle> fontStyles = [
    GoogleFonts.baloo2(),
    GoogleFonts.lobster(),
    GoogleFonts.righteous(),
    GoogleFonts.arimaMadurai(),
    GoogleFonts.boogaloo()
  ];

  static Widget futureBuilderWidget<T>(
    BuildContext context,
    AsyncSnapshot<T> snapshot,
    Widget Function(T? data) function, {
    bool nullable = false,
  }) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return const Center(child: CustomCircularIndicator());
      case ConnectionState.active:
      case ConnectionState.done:
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        final data = snapshot.data;

        if (data != null || nullable) return function(data);

        return const Center(child: CustomCircularIndicator());
    }
  }
}
