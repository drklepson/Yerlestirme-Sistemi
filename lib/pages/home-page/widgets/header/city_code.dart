import 'package:flutter/material.dart';
import 'package:yerlestirme_update/const/iller.dart';
import 'package:yerlestirme_update/controllers/screen_controller.dart';

class PlakaHalkasi extends StatelessWidget {
  const PlakaHalkasi({super.key, this.sehir});

  final String? sehir;

  @override
  Widget build(BuildContext context) {
    final kod = iller.keys.firstWhere(
      (element) => iller[element]!['name'] == (sehir ?? 'İSTANBUL'),
    );
    return Container(
      width: ScreenController.isMobile(context) ? 36 : 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Center(
        child: Text(
          kod,
          style: ScreenController.isMobile(context)
              ? Theme.of(context).textTheme.headlineMedium
              : Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
