import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
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

  static Future<void> launchUrlFunc(Uri url) async {
    if (!await launchUrl(url)) {
      throw ArgumentError('Could not launch $url');
    }
  }

  static Future<void> errorBottomSheet(BuildContext context, Object? error) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      constraints: const BoxConstraints(maxWidth: 360),
      isDismissible: false,
      builder: (bottomContext) {
        Future.delayed(
          const Duration(seconds: 3),
          () => bottomContext.pop(),
        );
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Text(error.toString()),
        );
      },
    );
  }
}
