import 'package:flutter/material.dart';
import 'package:yerlestirme_update/const/iller.dart';
import 'package:yerlestirme_update/controllers/screen_controller.dart';

class PlakaHalkasi extends StatelessWidget {
  const PlakaHalkasi({super.key, this.sehir});

  final String? sehir;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenController.isMobile(context) ? 36 : 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Center(
        child: Text(
          illerListesi.keys
              .firstWhere(
                (element) => illerListesi[element] == (sehir ?? 'İSTANBUL'),
              )
              .toString(),
          style: ScreenController.isMobile(context)
              ? Theme.of(context).textTheme.headlineMedium
              : Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
