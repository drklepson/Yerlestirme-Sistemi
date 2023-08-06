import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/tercih_list_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/chose_add/widgets/kadro_bilgi_card.dart';
import 'package:yerlestirme_update/utility/widgets/generic_drop.dart';

class TercihSecEkle extends StatefulWidget {
  const TercihSecEkle({required this.model, super.key});

  final TercihListModel model;

  @override
  State<TercihSecEkle> createState() => _TercihSecEkleState();
}

class _TercihSecEkleState extends State<TercihSecEkle> {
  ValueNotifier<KadroModel?> seciliKadro = ValueNotifier(null);
  final ValueNotifier<bool> _kadroUyari = ValueNotifier(false);
  late final TercihListModel pageModel;

  @override
  void initState() {
    pageModel = widget.model;
    super.initState();
    kadroUyariUpdate();
  }

  void kadroUyariUpdate() {
    _kadroUyari.value =
        pageModel.tercihValueList.contains(seciliKadro.value?.kadroId);
    // Kadro tercih listesinde var mı yok mu?
  }

  void seciliKadroDegistir(KadroModel model) {
    seciliKadro.value = model;
    kadroUyariUpdate();
  }

  void tercihEkleBtnFn() {
    if (seciliKadro.value != null) pageModel.tercihEkle(seciliKadro.value!);
  }

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(vertical: 16, horizontal: 24);

    return Card(
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        padding: edgeInsets,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<AuthController>(
              valueListenable: AuthController(),
              builder: (context, value, child) {
                if (value.firstKadroList == null) {
                  return const Text(
                    'Kadro Listesi Alınamadı.\nLütfen Sayfayı Yenileyin.',
                  );
                }
                return GenericAutoCompDrop<KadroModel>(
                  labelText: 'Kurum Adı',
                  itemView: (p0) => Text(p0.kurum),
                  items: value.firstKadroList!,
                  toStringMethod: (item) => item.kurum,
                  onSelected: seciliKadroDegistir,
                  onClearPressed: () => seciliKadro.value = null,
                  listWidth: min(
                    context.width < 600
                        ? context.width - 50
                        : context.width / 2 - 50,
                    580,
                  ),
                );
              },
            ),
            ValueListenableBuilder<KadroModel?>(
              valueListenable: seciliKadro,
              builder: (context, value, child) {
                return value != null
                    ? TercihBilgiCard(
                        seciliKadro: value,
                        kadroUyari: _kadroUyari.value,
                        model: pageModel,
                        onAdded: () => setState(() => seciliKadro.value = null),
                        width: 528,
                      )
                    : const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
