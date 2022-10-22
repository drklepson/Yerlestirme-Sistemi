// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/helpers/global_variables.dart';

const edgeInsets = EdgeInsets.symmetric(vertical: 8, horizontal: 16);
const reklamText =
    'Ben Buradayım App Instagram Sayfasını Takip Ederek Bana Destek Olursanız Sevinirim';
const instagramUrl = 'https://www.instagram.com/benburadayimapp/';

class BenBuradayim extends StatelessWidget {
  const BenBuradayim({super.key});

  @override
  Widget build(BuildContext context) {
    final instagramUri = Uri.parse(instagramUrl);

    return LayoutBuilder(
      builder: (_, p1) {
        final textStyle = p1.maxWidth < 600
            ? context.textTheme.titleMedium
            : context.textTheme.headlineSmall;
        return Card(
          child: Padding(
            padding: edgeInsets,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    reklamText,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: textStyle,
                  ),
                ),
                const SizedBox.square(dimension: 16),
                ElevatedButton(
                  onPressed: () => Globals.launchUrlFunc(instagramUri),
                  child: Text(
                    'Takip Et',
                    style: textStyle?.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
