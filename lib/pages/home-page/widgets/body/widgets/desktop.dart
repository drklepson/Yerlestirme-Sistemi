import 'package:flutter/material.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/tercih_list_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/chose_add/tercih_sec_ekle.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/kadro_statics/kadrolist_widget.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/see_and_send/tercih_gor_gonder.dart';

class HomeDesktopLayout extends StatelessWidget {
  const HomeDesktopLayout({required this.model, super.key});
  final TercihListModel model;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, sizes) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TercihSecEkle(model: model),
                Expanded(child: TercihGorGonder(model: model)),
              ],
            ),
          ),
          const Expanded(child: KadroListWidget())
        ],
      ),
    );
  }
}
