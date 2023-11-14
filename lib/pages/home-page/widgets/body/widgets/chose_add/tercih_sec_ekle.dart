import 'dart:math';

import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/pages/home-page/home_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/chose_add/kadro_bilgi_card.dart';

class TercihSecEkle extends StatelessWidget {
  const TercihSecEkle({super.key});

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(vertical: 16, horizontal: 24);

    return Consumer2<HomePageModel, AuthController>(
      builder: (context, pageModel, authModel, child) {
        return Card(
          child: Container(
            constraints: const BoxConstraints(minHeight: 100),
            padding: edgeInsets,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (authModel.firstKadroList == null)
                  const Text(
                    'Kadro Listesi Alınamadı.\nLütfen Sayfayı Yenileyin.',
                  )
                else
                  GenericAutoCompDrop<KadroModel>(
                    labelText: 'Kurum Adı',
                    itemView: (p0) => Text(p0.kurum),
                    items: authModel.firstKadroList!,
                    toStringMethod: (item) => item.kurum,
                    onSelected: pageModel.seciliKadroDegistir,
                    onClearPressed: pageModel.seciliKadroSil,
                    listWidth: min(
                      context.width < 600
                          ? context.width - 50
                          : context.width / 2 - 50,
                      580,
                    ),
                  ),
                if (pageModel.seciliKadro != null)
                  TercihBilgiCard(
                    seciliKadro: pageModel.seciliKadro,
                    kadroUyari: pageModel.kadroUyari,
                    model: pageModel,
                    onAdded: () {
                      pageModel.seciliKadroSil();
                    },
                    width: 528,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
