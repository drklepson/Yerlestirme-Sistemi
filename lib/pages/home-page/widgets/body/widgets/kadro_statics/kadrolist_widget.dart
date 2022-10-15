import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/kadro_statics/widgets/kadro_list_item.dart';

class KadroListWidget extends StatelessWidget {
  const KadroListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AuthController>(
      valueListenable: AuthController(),
      builder: (context, value, child) {
        final kadroList = value.firstKadroList;
        return Card(
          child: ListView.builder(
            itemCount: kadroList?.length ?? 0,
            itemBuilder: (context, index) {
              final gelenKadro = kadroList?.elementAt(index);
              final kazananlar = gelenKadro?.kazananlar;
              var tercihEdenler = gelenKadro?.tercihEdenler;
              tercihEdenler = tercihEdenler?.fold(
                <String>[],
                (previousValue, element) {
                  if (!(kazananlar?.contains(element) ?? false)) {
                    previousValue?.add(element);
                  }
                  return previousValue;
                },
              );

              return KadroListExpansionItem(
                kazananlar: kazananlar,
                gelenKadro: gelenKadro,
                tercihEdenler: tercihEdenler,
              );
            },
          ),
        );
      },
    );
  }
}
